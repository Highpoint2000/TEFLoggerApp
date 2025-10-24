# TEF Logger App
Interactive Logging App for TEF Receiver on Android Smartphones (Compatible from Android 8)

<img width="786" height="779" alt="image" src="https://github.com/user-attachments/assets/403e9a3e-ee25-4890-809a-b8779f48700b" />

## Version 5.21 (update recommended for all systems!)

- Update notification for older devices adjusted
- Manual frequency entry revised
- Auto scan mode is reset when the connection is lost
- minor adjustments

## Installation notes:

1. Install the newest TEF Firmware from [here](https://github.com/PE5PVB/TEF6686_ESP32/releases)
2. [Download](https://github.com/Highpoint2000/TEFLoggerApp/raw/refs/heads/main/TEFLogger_5.21.apk) the latest apk file 
3. Install the apk on your smartphone with paket manager
4. Confirm GPS access
5. Check your energy saving settings

## Tested on:

- Samsung Galaxy S7 Edge with Android 8
- Samsung Galaxy S8 with Android 9 / OneUI 1.0
- Samsung Galaxy A8 (2018) with Android 9 / OneUI 1.0
- Huawei P30 Pro with Android 10 / EMUI 12.0.0
- Samsung Galaxy A20e with Android 11 / OneUI 3.1
- Samsung Galaxy A12 with Android 12 / OneUI 4.1
- Samsung Galaxy A13 with Android 14 / OneUI 6.1
- Samsung Galaxy Tab A9+ with Android 15 / OneUI 7.0
- Samsung Galaxy S24 Ultra with Android 16 / OneUI 8.0

## Operation

See the detailed usage guide in the Wiki:  
[https://github.com/Highpoint2000/TEFLoggerApp/wiki](https://github.com/Highpoint2000/TEFLoggerApp/wiki)

## History:

### Version 5.2 (update recommended for all systems!)

- Mapcaching improved
- Autozoom button adjusted
- Double logging when rotating the display eliminated
- GPS display activated at startup
- File access permissions adjusted for supported Android versions
- Further code optimizations to make the app more stable and performant

### Version 5.1 (update recommended for all systems!)

- Comprehensive code optimizations to make the app more stable and performant, as well as running on older devices

### Version 5.01

- Fixed truncated display of the remote control bar on certain smartphones

### Version 5.0

- New interactive map with caching mechanism added (preloaded tiles therefore also work offline!)
- Tabular, distance-sorted list of all programs on a frequency
- Display of the current position (red dot) and tracking marker (blue dots)
- Map shows PI-identified (dashed line) and fully identified (solid line) stations with data
- Clicking on a map marker -> Listing of all programs at the location with direct query of the frequency. Exiting lock mode (lock symbol) is done by clicking on the map
- Streaming function for audio synchronization (after activating the play button -> click on the marker or selecting in the table) opens a live stream of the selected program
- Changing identified locations or linking programs with station IDs for station identification in the log file
- Log Ident function for continuously adopting and displaying changed station data
- Checking the power saving mode when starting the program
- Offline/online notification has been deactivated

A tutorial für the new Live MAPVIEWER can be download [here](https://github.com/Highpoint2000/TEFLoggerApp/blob/main/Tutorials/TEF_Logger_tutorial_for_LIVE_MAP_function_english.pdf) 

### Version 4.11 (HOTFIX VERSION - only works on Android Smartphones!)

- Hotfix for broken Autolog mode in version 4.1
 
### Version 4.1 (only works on Android Smartphones!)

- Added info button with location selection when multiple stations are found
- Added station ID display with editing option

### Version 4.00 (only works on Android Smartphones!)

- URDS Mapviewer integrated [Download Tutorial](https://github.com/Highpoint2000/TEFLoggerApp/blob/main/Tutorials/TEF_Logger_tutorial_for_URDS_MAP_function_english.pdf) 
- Background notification revised, new notification tone
- Improved internet connection check
- GPS processing adjusted
- Extensive bug fixing and performance improvement
- PTY alarm message deactivated
- Smaller design work

### Version 3.90 (only works on Android Smartphones!)

- Logos can be enlarged, reduced, and moved (see description!)
- Local caching of logos for faster loading
- GPS data display can be disabled via the menu
- PTY data can be displayed
- Toolbar added to display RDS, Stereo, TP, and TA

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
  
