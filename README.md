# SkyCast
 A flutter weather application


## Description
SkyCast is a user-friendly application that provides real-time weather data and forecasts for any location worldwide. Built with Flutter, it leverages powerful APIs to deliver accurate and up-to-date weather information, ensuring users can plan their activities effectively, no matter the weather.

## Application Download Link
- [Download SkyCast](https://drive.google.com/file/d/19AR8Z3pmJWwzUr75gvDTJcH3IjMWybem/view?usp=sharing)


## Responsibilities Overview
As the creator of SkyCast, my responsibilities included:


# 1. UI Design
   - Create a visually appealing user interface for the weather app.
   - Alternatively, utilize a provided [Figma design link](https://www.figma.com/file/dX2fGgCBNXdzVTAQLZGk1a/Weather-App-UI-Design?type=design&node-id=0%3A1&mode=design&t=M6cFywjr4XIGGn57-1) for UI elements.

# 2. Current Weather Conditions
   - Display essential weather data: temperature, description, forecast, sunrise, sunset, uv temp etc.

# 3. Forecast Display
   - Show a 3-day weather forecast with date, weather icons, and temperatures.

# 4. Weather Data Retrieval
   - Choose a public [weather API](https://www.weatherapi.com/) to fetch data.
   - Implement location services to automatically get the user’s location (latitude and longitude).

# 5. Location Management
   - Use the user's location to retrieve specific weather data.
   - Provide an option for users to manually enter a location.

# 6. Unit Conversion
   - Implement functionality to convert temperatures between Celsius and Fahrenheit.

# 7. Local Storage
   - Use a local database (like Hive or Sqflite) to persist fetched weather data for offline access.

# 8. Code Structure
   - Follow best practices for code structure, adhering to design patterns like MVC.
   - Use a state management library (like Riverpod or BLoC) instead of setState.

# 9. Error Handling
   - Gracefully manage exceptions and errors throughout the application.





## Challenges Faced
While developing the Weather App using the Riverpod state management library, I encountered several challenges:

 - Learning Curve: Transitioning from GetX to Riverpod posed a learning curve, especially in understanding the various types of providers and their use cases.
 
 - API Calls: Implementing API calls using FutureProvider was initially confusing. It took some time to grasp how to manage loading and error states effectively.
 
 - State Management: Differentiating between single state management and multiple state management was challenging. I had to rethink how to structure my state and when to use StateNotifierProvider for more complex scenarios.
 
 - UI Integration: Integrating providers into the UI using Consumer and handling the different states (loading, data, error) required practice and experimentation.

   

## How Challenges Were Overcome
To address these challenges, several strategies and solutions were implemented:

 - Study: I dedicated time to studying the Riverpod documentation, which provided a comprehensive understanding of the different providers and their use cases.

 - YouTube Tutorials and Blogs: I supplemented my learning by watching YouTube tutorials like **dbesTech** and reading various blogs focused on Riverpod. These resources offered practical examples and insights that enhanced my understanding of implementing state management effectively.

 - Learning from Errors: I embraced the errors I encountered as learning opportunities, analyzing what went wrong and adjusting my approach accordingly. This mindset helped me build resilience and adaptability.


## SkyCast UI

<div style="display: flex; flex-wrap: wrap;">
   <img src="https://github.com/hredhayxz/skycast/blob/main/screenshot_preview/1.jpg" width="250" />
<img src="https://github.com/hredhayxz/skycast/blob/main/screenshot_preview/2.jpg" width="250" />
 <img src="https://github.com/hredhayxz/skycast/blob/main/screenshot_preview/3.jpg" width="250" />
 <img src="https://github.com/hredhayxz/skycast/blob/main/screenshot_preview/4.jpg" width="250" />
 <img src="https://github.com/hredhayxz/skycast/blob/main/screenshot_preview/5.jpg" width="250" />
 <img src="https://github.com/hredhayxz/skycast/blob/main/screenshot_preview/6.jpg" width="250" />
</div>


## Getting Started

### Prerequisites

Ensure Flutter is installed on your machine. For installation instructions, refer to the official [Flutter website](https://flutter.dev/docs/get-started/install).

### Installation

Follow these steps to run the News Read Application:

1. Clone this repository to your local machine:

```bash
git clone https://github.com/hredhayxz/skycast.git
```

2. Navigate to the project folder:

```bash
cd skycast
```

3. Install dependencies:

```bash
flutter pub get
```

### How to Run

Connect your device or emulator and run the app using the following command:

```bash
flutter run
```

## Used Packages

CraftyBay integrates the following packages to enhance functionality:
- `http: ^1.2.2`: The HTTP package provides a straightforward way to make HTTP requests in your Flutter app. It's essential for fetching data from APIs and working with web services.
- `cached_network_image: ^3.4.1`: For network image caching and showing.
- `flutter_riverpod: ^2.5.1`: Riverpod is a state management library for Flutter that simplifies the process of managing application state. It provides a clean and efficient way to handle state and dependencies in your app.
- `flutter_screenutil: ^5.9.3`: A flutter plugin for adapting screen and font size.Let your UI display a reasonable layout on different screen sizes!
- `geolocator: ^13.0.1`: A Flutter geolocation plugin which provides easy access to platform specific location services.
- `flutter_launcher_icons: ^0.14.1`: This package simplifies the process of generating and setting app icons for your Flutter application. It allows you to customize app icons with ease.
- `intl: ^0.19.0`: Provides internationalization and localization facilities, including message translation, plurals and genders, date/number formatting and parsing, and bidirectional text.
- `hive: ^2.2.3 & hive_flutter: ^1.1.0`: Hive is a lightweight and buzzing-fast key-value NoSQL database made for Flutter and Dart.


## Project Directory Structure

The CraftyBay directory structure is organized as follows:

```

skycast/
├── assets/
│   └── images/
│       ├── app_logo.png
│       ├── bottom_bg.png
│       ├── sunrise_and_sunset.png
│       └── uv_index_image.png
└── lib/
    ├── controllers/
    │   └── weather_controller.dart
    ├── models/
    │   ├── helper/
    │   │   └── pref.dart
    │   └── weather_model.dart
    ├── providers/
    │   └── weather_provider.dart
    ├── services/
    │   ├── location_service.dart
    │   └── weather_service.dart
    ├── utils/
    │   ├── api_constants.dart
    │   ├── dimens.dart
    │   ├── image_utils.dart
    │   └── theme_manager.dart
    ├── views/
    │   ├── widgets/
    │   │   ├── weather_details/
    │   │   │   ├── day_button_widget.dart
    │   │   │   ├── hourly_weather_card.dart
    │   │   │   ├── hourly_weather_widget.dart
    │   │   │   ├── live_forecast_data_widget.dart
    │   │   │   ├── location_info_widget.dart
    │   │   │   ├── searchfield_widget.dart
    │   │   │   └── sunrise_sunset_view_widget.dart
    │   │   └── weather_details.dart
    │   └── home_screen.dart
    ├── app.dart
    └── main.dart

```

## Contributors

- [Md Alhaz Mondal Hredhay](https://github.com/hredhayxz)



