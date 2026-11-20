#!/usr/bin/env bash

# Define possible esptool commands
ESPTOOL_CANDIDATES=(esptool esptool.py)
ESPTOOL=""

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Display the tool header
echo -e "-----------------------------"
echo -e "- Update tool ESP32 TEF6686 -"
echo -e "-       ${RED}Development${NC}         -"
echo -e "-----------------------------"

# Check if any esptool command is available
# Iterate through possible esptool commands
for candidate in "${ESPTOOL_CANDIDATES[@]}"; do
    if command -v "${candidate}" &>/dev/null; then
        # If a candidate esptool command is found in PATH, use it
        ESPTOOL=${candidate}
        echo
        echo -e "${GREEN}Using detected esptool: $(which "${ESPTOOL}")${NC}"
        echo
        break
    fi
done

# If no esptool command was found, print an error message and exit
if [ -z "${ESPTOOL}" ]; then
    echo -e "${RED}Error: None of the possible esptool commands ${ESPTOOL_CANDIDATES[*]} are installed or not in your PATH.${NC}"
    echo
    echo "Please install esptool using the following command:"
    echo "  pip install --user esptool"
    echo
    echo "You can also install esptool package using your distribution's package manager."
    exit 1
fi

# Check what group is used for serial port access (depends on the distribution)
if [ $(getent group dialout) ]; then
    if ! groups "${USER}" | grep -q '\bdialout\b'; then
        echo -e "${RED}Error: User '${USER}' is not a member of the 'dialout' group.${NC}"
        echo "Please add the user to the 'dialout' group to access the serial port."
        echo "You can add the user to the group with the following command (may require sudo):"
        echo "  sudo usermod -aG dialout ${USER}"
        echo "After adding, you need to reboot for the changes to take effect."
        exit 1
    fi
elif [ $(getent group uucp) ]; then
    if ! groups "${USER}" | grep -q '\buucp\b'; then
        echo -e "${RED}Error: User '${USER}' is not a member of the 'uucp' group.${NC}"
        echo "Please add the user to the 'uucp' group to access the serial port."
        echo "You can add the user to the group with the following command (may require sudo):"
        echo "  sudo usermod -aG uucp ${USER}"
        echo "After adding, you need to reboot for the changes to take effect."
        exit 1
    fi
else
    echo "Couldn't detect what group is used to access serial ports on your distribution."
    exit 1
fi

# Detect available /dev/ttyUSB* devices
# These devices represent USB-to-serial converters
mapfile -t USB_DEVICES < <(ls /dev/ttyUSB* 2>/dev/null)

# Check if any /dev/ttyUSB* devices are found
if [ ${#USB_DEVICES[@]} -eq 0 ]; then
    echo -e "${RED}Error: No /dev/ttyUSB* devices found.${NC}"
    echo "Please connect your device and try again."
    exit 1
elif [ ${#USB_DEVICES[@]} -eq 1 ]; then
    # If only one USB device is found, use it
    SERIAL_PORT="${USB_DEVICES[0]}"
    echo -e "${GREEN}Using detected serial port: ${SERIAL_PORT}${NC}"
else
    # If multiple USB devices are found, prompt the user to select one
    echo "Multiple /dev/ttyUSB* devices found:"
    for i in "${!USB_DEVICES[@]}"; do
        echo "  [$i]: ${USB_DEVICES[$i]}"
    done
    echo
    read -rp "Please select the serial port [0-$((${#USB_DEVICES[@]} - 1))]: " selection
    if [[ ${selection} =~ ^[0-9]+$ ]] && [ "${selection}" -ge 0 ] && [ "${selection}" -lt ${#USB_DEVICES[@]} ]; then
        SERIAL_PORT="${USB_DEVICES[${selection}]}"
    else
        echo -e "${RED}Invalid selection. Exiting.${NC}"
        exit 1
    fi
fi

# Prompt user for BOOT-button information
# This is specific to the ESP32 flashing procedure
while true; do
    echo
    read -rp "Does your radio have a BOOT-button to flash the radio? (Y/n): " input
    input=${input:-Y} # Default to 'Y' if no input is provided
    case ${input} in
    [Yy]*)
        boot_button=true
        break
        ;;
    [Nn]*)
        boot_button=false
        break
        ;;
    *) echo "Please answer yes (y) or no (n)." ;;
    esac
done

# Prompt user to hold the BOOT-button if applicable
if ${boot_button}; then
    echo
    echo "Switch ON the radio while holding the BOOT-button and press Enter."
    read -r
fi

# Upload software to the ESP32. The output of esptool is turned into one progress bar
# per file, updated on the same line; its exit status is kept through the pipe.
echo
echo "Uploading software..."
labels=(bootloader partitions boot_app0 firmware coredump)
${ESPTOOL} --chip esp32 --port "${SERIAL_PORT}" --baud 921600 --before default_reset \
    --after hard_reset write_flash -z --flash_mode dio --flash_freq 80m --flash_size 4MB \
    0x1000 bootloader.bin 0x8000 partitions.bin 0xe000 boot_app0.bin 0x10000 firmware.bin \
    0x3c0000 coredump_blank.bin 2>&1 | {
    i=0; last=""; finished=0; label="data"
    while IFS= read -r line; do
        if [[ ${line} =~ Writing\ at\ .*\ ([0-9]+)\.([0-9])%\ [^/]+/([^\ ]+) ]]; then
            whole=${BASH_REMATCH[1]}; tenth=${BASH_REMATCH[2]}; total=${BASH_REMATCH[3]}
            if [[ ${total} != "${last}" ]]; then   # a new file: the size after the slash changes
                last=${total}; finished=0; label=${labels[i]:-data}; i=$((i + 1))
            fi
            (( finished )) && continue              # esptool repeats the final line of a file
            n=$(( (whole * 10 + tenth) * 30 / 1000 ))
            bar=$(printf '%*s' "${n}" '' | tr ' ' '=')
            printf '\r  %-12s[%-30s] %s.%s%%' "${label}" "${bar}" "${whole}" "${tenth}"
            if (( whole >= 100 )); then echo; finished=1; fi
        elif [[ ${line} =~ [Ee]rror|[Ff]atal|[Ff]ailed ]]; then
            echo; echo "${line}"
        fi
    done
}
if [ "${PIPESTATUS[0]}" -ne 0 ]; then
    echo
    echo -e "${RED}Error uploading! Please check the serial port and radio for download state.${NC}"
    echo "Press Enter to exit the update tool."
    read -r
    exit 1
fi

# Completion message
echo
echo -e "${GREEN}Update completed.${NC}"