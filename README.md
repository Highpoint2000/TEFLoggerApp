# TEF Logger App
Interactive Logging App for TEF Receiver on Android Smartphones (Compatible from Android 9)

![image](https://github.com/user-attachments/assets/1852affa-ddb2-4494-a6ca-6f81ca6f6328)

### Version 3.4 (only works from TEF Firmware from v2.11.23 and Android Smartphones!)

- Revision of the station detection algorithm
- Implementation of a caching mode for the database data to enable offline logging (see menu item "Rebuild Cache")
- Underscores added in PS information

## Installation notes:

1. Install new TEF Firmware from [here](https://github.com/Highpoint2000/TEFLoggerApp/tree/main/TEF_Firmware)
2. [Download](https://raw.githubusercontent.com/Highpoint2000/TEFLoggerApp/main/TEFLogger_2.4.apk) the last apk 
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
- You can switch between the light and dark design using the menu
- The Operations menu item gives you access to the upload and copy functions
- Valid FMLIST data (OMID + email address) must be entered for the upload
- Copied CSV files are located in the /Downloads/URDS folder on the smartphone
- The app is able to continue logging in the background. To do this, you may need to adjust the energy saving options in your smartphone!
- Individual files are merged before uploading
- To use the app offline (e.g. when roaming abroad), the database for the frequency range 87.5-108 MHz can be completely downloaded via the menu option "Rebuild Cache")

## History: 

### Version 3.3 (only works from TEF Firmware from v2.11.23 and Android Smartphones!)

- Station name from DB is now displayed
- faster algorithm for determining station data if PI Code received
- additional, larger display of the received station, location and distance in landscape mode
- query to toggle the auto log mode when starting/stopping the auto scan mode

### Version 3.2 (only works from TEF Firmware from v2.11.23 and Android Smartphones!)

- incorrect height corrected across the board

### Version 3.1 (only works from TEF Firmware from v2.11.23 and Android Smartphones!)

- Coordinates are rounded to 6 decimal places
- After starting/restarting the app, you will be asked whether the CSV file should be recreated or the last one should be continued
- Fixed error when processing TEF time in 12h format (Error writing to log file: index: 2, Size: 1)

### Version 3.0 (only works from TEF Firmware from v2.11.23 and Android Smartphones!)

- Added remote functions for TEF (activate in menue): Freq up/down - Search up/down - Auto Scan on/off - Frequency input (longer hold auto scan) 
- Correction of the status bar and gps display
- TEF type and firmware version integrated into URDS upload file

### Version 2.4 (only works from TEF Firmware from v2.11.21 and Android Smartphones!)

- Design and function is now compatible with Android 15
- Radio text can be optionally switched on
- Long press on the checkboxes of the CSV files selects or deselects all files
- Minor code optimizations

### Version 2.3 (only works from TEF Firmware from v2.11.21 and Android Smartphones!)

- Added source selection for multiple TEF receivers

### Version 2.2 (only works from TEF Firmware from v2.11.21 and Android Smartphones!)

- Improved background mode
- Bug with the mono/stereo flag fixed
- White font now black in daylight mode 
- Repeated station IDs eliminated
- Log button only becomes active when GPS data is received
- Added dbµV flag

### Version 2.1 (only works from TEF Firmware from v2.11.21 and Android Smartphones!)

- Improved background mode
- Always on display
- Vibration and sound status are updated on startup and saved on exit
- The map now remains activated even when the display is rotated
- Other bug fixes and design adjustments

### Version 2.0 (only works from TEF Firmware from v2.11.21 and Android Smartphones!)

- URDS Uploader integrated with copy functions
- MAP view of identified stations
- Switch between day and night design
- Notifications about available app updates
- Code and UI optimizations
  
