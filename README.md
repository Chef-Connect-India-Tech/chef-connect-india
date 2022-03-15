# Chef-Connect-India-App

## Android App

### Local System Setup (Flutter on VSCode)

**System Requirements**
>  1. **Operating Systems:** Windows 7 SP1 or later (64-bit), x86-64 based.
>  2. **Disk Space:** 1.64 GB (does not include disk space for IDE/tools).
>  3. **Tools:** Flutter depends on these tools being available in your environment.
        `1. Windows PowerShell 5.0 or newer (this is pre-installed with Windows 10)`
        `2. Git for Windows 2.x, with the Use Git from the Windows Command Prompt option.`

**Step-1: Download JDK(Java Development Kit)**
> 1. Download JDK from [oracle.com](https://www.oracle.com/java/technologies/downloads/). 
> 2. Extract the zip file in the desired location.
> 3. Update the path of jdk/bin in the system environment variables.

**Step-2: Download Flutter SDK**
> 1. Download Flutter SDK zip from [Flutter.dev](https://docs.flutter.dev/get-started/install/windows) website.
> 2. Extract the zip file in the desired location.
> 3. Update the path of flutter/bin in the system environment variables.

**Step-3: Android Setup**
> 1. Download and install [Android Studio](https://developer.android.com/studio).
> 2. Start Android Studio, and go through the ‘Android Studio Setup Wizard’. This installs the latest Android SDK, Android SDK Command-line Tools, and Android SDK Build-Tools, which are required by Flutter when developing for Android.
> 3. Run `flutter doctor` to confirm that Flutter has located your installation of _Android Studio_. If Flutter cannot locate it, run `flutter config --android-studio-dir <directory>` to set the directory that Android Studio is installed to.
> 4. Also download the light weight code editor VSCode and install the extensions (**Dart and Flutter**) 

**Step-4: Accept Android Licenses:**
> 1. Open Command prompt and then run `flutter doctor --android-licenses`.
> 2. Accept all the licenses that are prompted.

**Video tutorial for Android Studio and Flutter Setup** --- [click here for video](https://www.youtube.com/watch?v=hfz_AraTk_k)

