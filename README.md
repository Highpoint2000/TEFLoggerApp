# TEF Logger App
Interactive Logging App for TEF Receiver on Android Smartphones (Compatible from Android 9)

<img width="1158" height="1061" alt="Screenshot" src="https://github.com/user-attachments/assets/9e6f62f5-97a9-4aad-b75b-7afa4885593b" />

## Version 3.9 (only works on Android Smartphones!)

- Logos can be enlarged, reduced, and moved (see description!)
- Local caching of logos for faster loading
- GPS data display can be disabled via the menu
- PTY data can be displayed
- Toolbar added to display RDS, Stereo, TP, and TA

## Installation notes:

1. Install the newest TEF Firmware from [here](https://github.com/PE5PVB/TEF6686_ESP32/releases)
2. [Download](https://github.com/Highpoint2000/TEFLoggerApp/raw/refs/heads/main/TEFLogger_3.81.apk) the latest apk file 
3. Install the apk on your smartphone with paket manager
4. Confirm GPS access
5. Check your energy saving settings

## Notes: 

- TEF receiver and smartphone must be in the same WLAN or connected via the hotspot
- As soon as data is received from the TEF, it will be shown on the display
- If there are several TEF receivers in the network, the correct one can be selected in the menu under TEF Source
- The remote control functions for TEF can be activated/deactivated via the menu (TEF Remote): Freq up/down – Search up/down – Auto scan on/off – Frequency entry (long press Auto scan)
- If GPS is switched on and has reception, the GPS data is shown on the display
- Tap 'MAN LOG' to log data manually, long-press the button to activate AUTO-Logging, the log data is written to a CSV file in URDS format
- A click on TX Map in the top bar opens the map which shows the identified stations, a click on GPS DATA switches back again
- You can activate a confirmation tone or vibration for logging using the three points at the top right (menu selection)
- You can switch between the light and dark design and the display of RT and AF (with click function) by activating it in the menu
- The Operations menu item gives you access to the upload and copy functions
- Valid FMLIST data (OMID + email address) must be entered for the upload
- Copied CSV files are located in the /Downloads/URDS folder on the smartphone
- The app is able to continue logging in the background. To do this, you may need to adjust the energy saving options in your smartphone!
- Individual files are merged before uploading
- To use the app offline (e.g. when roaming abroad), the database for the frequency range 87.5-108 MHz can be completely downloaded via the menu option "Rebuild Cache")
- The TEF Rename menu item can be used to assign a name to the currently selected IP address
- Station logo display can be switched on or off via menu function
- Holding the Station logo down puts it into wiggle mode. You can then zoom in/out using the +/- buttons or drag and drop. A single tap on the logo returns it to its normal size, and a double tap returns it to its original position.
- The GPS data can be hidden via the menu to create more space for displaying AF and RT as well as larger logos
- PTY data can be displayed via the menu

## History: 

### Version 3.81 (only works on Android Smartphones!)

- Added display of station logos in SVG format and corrected position

### Version 3.80 (only works on Android Smartphones!)

- Station logo display added
- TX detection algorithm updated and Database query speeds up
- Improved detection and switching of TEF devices
- Support for GPS positioning data via Wi-Fi

### Version 3.73

- More design adjustments for Android 15
- Counter for #Pi #PS #rawPi added

### Version 3.72 

- Design adjustments for Android 15
- Display of Alternative Frequencies (AF) with click function added

### Version 3.7 (only works from TEF Firmware from v2.11.23)

- new menu function to set the map radius around the current coordinates to better identify the possible transmission locations
- removed new update message when rotating the display


### Version 3.61 (only works from TEF Firmware from v2.11.23)

- Crash bug from version 3.6 fixed

### Version 3.6 (only works from TEF Firmware from v2.11.23)

Bug fixes and code improvements:
- Crash bug from version 3.5 fixed
- Last TEF source and Switch Theme selection are restored upon restart
- Menu selection for Sound, Vibration, and RT is restored when rotating the display
- CSV query is now performed every time Auto Log is started

### Version 3.5 (only works from TEF Firmware from v2.11.23)

- Pi-Code 0000 is now being processed
- The TEF Rename menu item can be used to assign a name to the currently selected IP address


### Version 3.4 (only works from TEF Firmware from v2.11.23)

- Revision of the station detection algorithm
- Implementation of a caching mode for the database data to enable offline logging (see menu item "Rebuild Cache")
- Underscores added in PS information

### Version 3.3 (only works from TEF Firmware from v2.11.23)

- Station name from DB is now displayed
- faster algorithm for determining station data if PI Code received
- additional, larger display of the received station, location and distance in landscape mode
- query to toggle the auto log mode when starting/stopping the auto scan mode

### Version 3.2 (only works from TEF Firmware from v2.11.23!)

- incorrect height corrected across the board

### Version 3.1 (only works from TEF Firmware from v2.11.23)

- Coordinates are rounded to 6 decimal places
- After starting/restarting the app, you will be asked whether the CSV file should be recreated or the last one should be continued
- Fixed error when processing TEF time in 12h format (Error writing to log file: index: 2, Size: 1)

### Version 3.0 (only works from TEF Firmware from v2.11.23)

- Added remote functions for TEF (activate in menue): Freq up/down - Search up/down - Auto Scan on/off - Frequency input (longer hold auto scan) 
- Correction of the status bar and gps display
- TEF type and firmware version integrated into URDS upload file

### Version 2.4 (only works from TEF Firmware from v2.11.21)

- Design and function is now compatible with Android 15
- Radio text can be optionally switched on
- Long press on the checkboxes of the CSV files selects or deselects all files
- Minor code optimizations

### Version 2.3 (only works from TEF Firmware from v2.11.21)

- Added source selection for multiple TEF receivers

### Version 2.2 (only works from TEF Firmware from v2.11.21)

- Improved background mode
- Bug with the mono/stereo flag fixed
- White font now black in daylight mode 
- Repeated station IDs eliminated
- Log button only becomes active when GPS data is received
- Added dbµV flag

### Version 2.1 (only works from TEF Firmware from v2.11.21)

- Improved background mode
- Always on display
- Vibration and sound status are updated on startup and saved on exit
- The map now remains activated even when the display is rotated
- Other bug fixes and design adjustments

### Version 2.0 (only works from TEF Firmware from v2.11.21)

- URDS Uploader integrated with copy functions
- MAP view of identified stations
- Switch between day and night design
- Notifications about available app updates
- Code and UI optimizations
  
