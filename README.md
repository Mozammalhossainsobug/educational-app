<p align="center">
  <a href="https://github.com/Mozammalhossainsobug/educational-app"><img src="https://img.shields.io/badge/View%20on-GitHub-blue?style=flat&logo=github" alt="GitHub"></a>
  <a href="https://github.com/Mozammalhossainsobug/educational-app"><img src="https://img.shields.io/badge/Star%20on-GitHub-642B73?style=flat&logo=github" alt="Star on GitHub"></a>
<a href="https://github.com/Mozammalhossainsobug/educational-app/releases"><img src="https://img.shields.io/badge/GitHub-Release-informational?style=flat&logo=github" alt="GitHub Release"></a>
  <a href="https://opensource.org/licenses/Apache-2.0"><img src="https://img.shields.io/badge/License-Apache%202.0-832878?style=flat" alt="License: Apache"></a>
</p>





# EduConnect - Elevate Your Learning Experience
<table>
  <tr>
    <td>
      <img src="/assets/images/appLogo.jpeg" height=70 align="left"> 
    <p>
    EduConnect is an innovative and user-friendly feature designed to enhance real-time communication within your educational Flutter application. It introduces a variety of functionalities to foster seamless and engaging interactions between users, ultimately elevating the overall learning experience.
      </p>
    </td>
  </tr>
</table>

## Screenshots

<table>
  <tr>
    <td>Login Page</td>
    <td>Sign Up Page</td>
    <td>Dashboard Page</td>
    <td>Video Playing Page</td>
  </tr>
  <tr>
    <td><img src="/assets/screenshots/log_in_page.png" width=270 ></td>
    <td><img src="/assets/screenshots/sign_up_page.png" width=270 ></td>
    <td><img src="/assets/screenshots/dashboard.png" width=270 ></td>
    <td><img src="/assets/screenshots/video_playing_page.png" width=270 ></td>
  </tr>
 </table>

<table>
  <tr>
    <td>Error View</td>
    <td>Bookmark View</td>
    <td>Completion View</td>
  </tr>
  <tr>
    <td><img src="/assets/screenshots/wrong_sign_in_screen_view.png" width=270 ></td>
    <td><img src="/assets/screenshots/bookmark_view.png" width=270 ></td>
    <td><img src="/assets/screenshots/completion_confirmation_view.png" width=270 ></td>
  </tr>
 </table>

**Don't forget to star⭐ the repo if you find it useful!**


## Changelog

Changes and progress about development is all heavily documented in GitHub [commits](https://github.com/Mozammalhossainsobug/educational-app/commits/main) and in the [changelog]()

## Key Features

### 🔒 Sign In
-  Allows users to sign in using their email and password.
- **Usage:** Provides secure authentication for existing users through API calls.

### 📝 Sign Up
- Facilitates user registration with essential information, including name, email, and password, along with validation through API calls.
- **Usage:** Streamlines the onboarding process for new users, ensuring data accuracy and adherence to specified formats.

### 🎥 Video Playback
- Enables users to seamlessly play videos associated with specific courses.
- **Usage:** Enhances the learning experience by providing an interactive platform for course content delivery.

### 📌 Bookmarking
- Allows users to bookmark specific timestamps within a video for future reference.
- **Usage:** Enables users to mark key moments in the video for quick navigation and review.

### ⏪⏩ Navigation
- Provides navigation controls for users to move between previous and next videos in a course.
- **Usage:** Enhances user flexibility by allowing them to explore course content at their own pace.

### 🎉 Course Completion Celebration
- Displays a congratulatory pop-up message upon the successful completion of a course.
- **Usage:** Provides positive reinforcement and acknowledges users' achievements, contributing to a rewarding learning experience.


## Application Architecture

The application was created using the clean-architecture. Flutter riverpod is used for state management.

### File Structure
A High-level overview of the project structure:
```

lib/
└── src/
    ├── core
    ├── feature/
    │   ├── authentication/
    │   │   ├── sign_in
    │   │   └── sign_up
    │   ├── dashboard
    │   ├── playlist
    └── main.dart

```
A High-level overview of a feature:
```

└── sign_in /
    ├── data/
    │   ├── data_source
    │   ├── model
    │   └── repository
    ├── domain/
    │   ├── entities
    │   ├── repositories
    │   └── use_cases
    └── presentation/
        ├── pages
        ├── riverpod
        └── widget              
```

## Bundled Packages

This repository utilizes several packages, each serving a specific purpose. You can find the complete list of dependencies in the `pubspec.yaml` file.

<details>
<summary>Dependencies</summary>

* [firebase_core](https://pub.dev/packages/firebase_core/versions/2.23.0)
* [firebase_auth](https://pub.dev/packages/firebase_auth/versions/4.14.1)
* [flutter_riverpod](https://pub.dev/packages/flutter_riverpod/versions/2.4.8)
* [flutter_svg](https://pub.dev/packages/flutter_svg/versions/2.0.9)
* [flutter_screenutil](https://pub.dev/packages/flutter_screenutil/versions/5.9.0)
* [intl](https://pub.dev/packages/intl/versions/0.18.1)
* [equatable](https://pub.dev/packages/equatable/versions/2.0.5)
* [logger](https://pub.dev/packages/logger/versions/2.0.2+1)
* [pretty_dio_logger](https://pub.dev/packages/pretty_dio_logger/versions/1.3.1)
* [quickalert](https://pub.dev/packages/quickalert/versions/1.0.2)
* [chewie](https://pub.dev/packages/chewie/versions/1.7.4)
* [video_player](https://pub.dev/packages/video_player/versions/2.8.1)

</details>


## Developer Notes

### Crashlytics and Analytics
To enable Firebase Crashlytics and Analytics, do the following:

1. Create a new project in [console.firebase.google.com](https://console.firebase.google.com/).Call the Firebase project whatever you like; just **remember the name**.You don't need to enable Analytics in the project if you don't want to.
2. [Install `firebase-tools`](https://firebase.google.com/docs/cli?authuser=0#setup_update_cli) on your machine.
3. [Install `flutterfire` CLI](https://firebase.flutter.dev/docs/cli#installation) on your machine.
4. In the root of this project (the directory containing `pubspec.yaml`), run the following:
- `flutterfire configure`
    - This command asks you for the name of the Firebase project that you created earlier, and the list of target platforms you support.As of April 2022, only `android` and `ios` are fully supported by Crashlytics.
    - The command rewrites `lib/firebase_options.dart` with the correct code.
5. Go to `lib/main.dart` and uncomment the lines that relate to Crashlytics and Analytics.
   You should now be able to see crashes, errors, and severe log messages in [console.firebase.google.com](https://console.firebase.google.com/).To test, add a button to your project, and throw whatever exception you like when the player presses it.

### Building the project
* To run the **Flutter project**,open it in your editor, first run `pub get` of network module initially, then run `pub get` of the auth-module-app and click the play button, or run `flutter run` on your terminal.

### Android Release
* To build an app-bundle Android release, run `flutter build appbundle --release`

Note: required Android SDK.

### iOS Release
* To build an IPA iOS release, run `flutter build ipa`

Note: requires MacOS.

### Firebase Deployment
* To deploy to firebase, run `firebase deploy`

Note: required Firebase.

### GitHub release
* Create a tag for the current version specified in `pubspec.yaml`
* `git tag <version>`
* Push the tag
* `git push origin <version>`
* Create the release and upload binaries
* https://github.com/Mozammalhossainsobug/educational-app/develop
