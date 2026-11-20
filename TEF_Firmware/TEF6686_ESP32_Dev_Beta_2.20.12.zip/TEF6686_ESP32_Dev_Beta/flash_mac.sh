#!/usr/bin/env bash
# Update tool for macOS. Run it from a terminal in this folder:
#   bash flash_mac.sh
# It needs esptool (brew install esptool, or pip3 install esptool) and works with the
# bash 3.2 that comes with macOS.

# Define possible esptool commands
ESPTOOL_CANDIDATES="esptool esptool.py"
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

# Work in the folder of this script, wherever it is started from
cd "$(dirname "$0")" || exit 1

# Check if any esptool command is available
for candidate in ${ESPTOOL_CANDIDATES}; do
    if command -v "${candidate}" >/dev/null 2>&1; then
        ESPTOOL=${candidate}
        echo
        echo -e "${GREEN}Using detected esptool: $(command -v "${ESPTOOL}")${NC}"
        echo
        break
    fi
done

# If no esptool command was found, print an error message and exit
if [ -z "${ESPTOOL}" ]; then
    echo -e "${RED}Error: None of the possible esptool commands (${ESPTOOL_CANDIDATES}) are installed or not in your PATH.${NC}"
    echo
    echo "Please install esptool with Homebrew:"
    echo "  brew install esptool"
    echo "or with pip:"
    echo "  pip3 install --user esptool"
    exit 1
fi

# Detect the USB serial converters. macOS names them /dev/cu.usbserial-XXXX (FTDI and
# CH340 with the Apple driver), /dev/cu.wchusbserialXXXX (CH340 with the WCH driver) or
# /dev/cu.SLAB_USBtoUART (CP210x). The cu.* devices are the ones to use, not tty.*.
USB_DEVICES=""
COUNT=0
for dev in /dev/cu.usbserial* /dev/cu.wchusbserial* /dev/cu.SLAB_USBtoUART* /dev/cu.usbmodem*; do
    [ -e "${dev}" ] || continue
    USB_DEVICES="${USB_DEVICES} ${dev}"
    COUNT=$((COUNT + 1))
done

if [ "${COUNT}" -eq 0 ]; then
    echo -e "${RED}Error: No USB serial device found.${NC}"
    echo "Please connect the radio and try again. A CH340 based board may need the driver"
    echo "from the WCH website; a CP210x board the driver from Silicon Labs."
    exit 1
elif [ "${COUNT}" -eq 1 ]; then
    SERIAL_PORT=$(echo ${USB_DEVICES})
    echo -e "${GREEN}Using detected serial port: ${SERIAL_PORT}${NC}"
else
    echo "Multiple USB serial devices found:"
    n=0
    for dev in ${USB_DEVICES}; do
        echo "  [${n}]: ${dev}"
        n=$((n + 1))
    done
    echo
    read -rp "Please select the serial port [0-$((COUNT - 1))]: " selection
    SERIAL_PORT=""
    if [[ ${selection} =~ ^[0-9]+$ ]] && [ "${selection}" -lt "${COUNT}" ]; then
        n=0
        for dev in ${USB_DEVICES}; do
            [ "${n}" -eq "${selection}" ] && SERIAL_PORT=${dev}
            n=$((n + 1))
        done
    fi
    if [ -z "${SERIAL_PORT}" ]; then
        echo -e "${RED}Invalid selection. Exiting.${NC}"
        exit 1
    fi
fi

# Prompt user for BOOT-button information
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
