# TEF Logger App *** BETA VERSION ***
Interactive Logging App for TEF Receiver on Android Smartphones (Compatible from Android 8)

<img width="786" height="779" alt="image" src="https://github.com/user-attachments/assets/403e9a3e-ee25-4890-809a-b8779f48700b" />

### Version 6.02_BETA1

RDS Predictor revised:
- SpE-Cache: Implemented an aggressive 5-minute cache expiration for DX stations (>800 km) to prevent long-term PI blocking after a Sporadic-E opening.
- Dynamic Thresholds: Added distance-based confirmation thresholds, dynamically scaling the required error-free hits from 2 (Local Tropo) up to 6 (SpE / Meteor Scatter) to suppress Ghost PIs.
- Hysteresis Limit: Disabled instant memory restore for stations >800 km. Sporadic-E stations must now re-verify live during fading instead of permanently sticking to the cached name.
- Dummy-PI Blocker: Integrated strict single-candidate validation. The app now rejects sole FMDX database matches if they severely conflict with the live received PS characters.

## Installation notes:

1. Install the newest TEF Firmware from [here](https://github.com/PE5PVB/TEF6686_ESP32/releases)
2. [Download](https://github.com/Highpoint2000/TEFLoggerApp/raw/refs/heads/main/Development/TEFLogger_6.02_BETA1.apk) the latest apk file 
3. Install the apk on your smartphone with paket manager
4. Confirm GPS access
5. Check your energy saving settings

## Tested on:

- Samsung Galaxy S7 Edge with Android 8
- Samsung Galaxy Tab A with Android 8.1
- Samsung Galaxy S8 with Android 9 / OneUI 1.0 (Chrome update required -> external APK!)
- Samsung Galaxy A8 (2018) with Android 9 / OneUI 1.0 (Chrome update required -> external APK!)
- Samsung Galaxy A6 with Android 10 / OneUI 2.0
- Samsung Galaxy Tab A 10.5 (2018) with Android 10 / OneUI 2.1
- Samsung Galaxy A20e with Android 11 / OneUI 3.1
- Samsung Galaxy A12 with Android 12 / OneUI 4.1
- Samsung Galaxy Tab A7 10.4 with Android 12 / OneUI 4.1
- Samsung Galaxy A51 with Android 13 / OneUI 5.1
- Samsung Galaxy A13 with Android 14 / OneUI 6.1
- Samsung Galaxy Tab A9+ with Android 15 / OneUI 7.0
- Samsung Galaxy S24 Ultra with Android 16 / OneUI 8.0

## Operation

See the detailed usage guide in the Wiki:  
[https://github.com/Highpoint2000/TEFLoggerApp/wiki](https://github.com/Highpoint2000/TEFLoggerApp/wiki)



  
