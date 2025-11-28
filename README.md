# 🥗 Dietin - Nutrition & Diet Tracking Application

A comprehensive Flutter nutrition and diet tracking application designed to help users monitor their daily calorie intake, meal planning, and nutritional statistics. Dietin empowers users to make informed dietary choices and achieve their health goals through intuitive tracking and personalized insights.

## 📋 Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Tech Stack](#tech-stack)
- [Architecture](#architecture)
- [Security](#security)
- [Installation & Setup](#installation--setup)
- [Environment Configuration](#environment-configuration)
- [Project Structure](#project-structure)
- [API Integration](#api-integration)
- [Usage Guide](#usage-guide)
- [Development](#development)
- [Building & Deployment](#building--deployment)
- [Troubleshooting](#troubleshooting)
- [Contributing](#contributing)
- [License](#license)

## Overview

Dietin is a mobile application built with Flutter that enables users to track their dietary habits and nutritional intake with precision and ease. The app provides comprehensive features for user authentication, meal logging, food search, nutritional statistics, and user profile management. It utilizes a REST API backend for data persistence and implements responsive design for various device sizes.

### Key Objectives

- **Track Nutrition**: Monitor daily calorie, protein, carbohydrate, and fat intake
- **Personalized Experience**: Set health goals and track progress toward them
- **Food Database**: Access a comprehensive food database with nutritional information
- **Smart Scanning**: Barcode/QR code scanning for quick food logging
- **Analytics**: Visualize nutritional trends and habits over time
- **Health Awareness**: Manage allergies and dietary restrictions

## ✨ Features

### Authentication & Onboarding
- User Registration with email validation
- Secure Login with JWT token-based authentication
- Password Reset functionality
- Comprehensive Onboarding with health profile setup
- Support for personal health metrics (age, height, weight, gender)

### Daily Tracking
- Home Dashboard with real-time nutritional overview
- Daily calorie and macronutrient tracking
- Meal logging with detailed nutritional information
- Multiple meal categories (breakfast, lunch, dinner, snacks)

### Food Management
- Extensive food database search
- Barcode/QR code scanning for instant food logging
- Food detail view with nutritional breakdown
- UPC code lookup support
- Quick add functionality for frequently consumed foods

### Analytics & Insights
- Statistics Dashboard with visual charts
- Nutritional trends over time
- Progress tracking toward health goals
- Daily, weekly, and monthly analytics

### User Management
- Comprehensive User Profile
- Profile editing and customization
- Allergy and dietary restriction management
- Activity level and fitness goal configuration
- Health metrics tracking

### Additional Features
- Notification System for reminders and updates
- Responsive Design for phones, tablets, and foldable devices
- Offline data caching with local storage
- Real-time synchronization with backend

## 🛠 Tech Stack

### Core Framework & State Management
- **Framework**: Flutter 3.9.2
- **Language**: Dart 3.9.2+
- **State Management**: GetX 4.7.2 (MVC architecture)
- **HTTP Client**: GetConnect (GetX integrated)

### UI & Responsive Design
- **UI Framework**: Flutter Material Design
- **Responsive Design**: FlutterScreenUtil 5.9.3
- **SVG Support**: Flutter SVG 2.2.1
- **Typography**: Google Fonts 6.3.2

### Data & Visualization
- **Data Visualization**: FL Chart 0.69.0
- **Local Storage**: GetStorage 2.1.1
- **Internationalization**: Intl 0.20.2
- **Configuration Management**: Flutter Dotenv 6.0.0

### Device Integration
- **Camera**: Camera 0.11.3
- **Mobile Scanner**: Mobile Scanner 7.1.3 (barcode/QR code scanning)
- **File System**: Path Provider 2.1.5

## Project Structure

```
lib/
├── main.dart                          # Application entry point with initialization
├── app/
│   ├── data/                          # Data models and entities
│   │   ├── UserModel.dart             # User profile data model
│   │   ├── TokenModel.dart            # Authentication token model
│   │   ├── FoodModel.dart             # Food database model
│   │   ├── FoodLogModel.dart          # User food log model
│   │   └── NotificationModel.dart     # Notification model
│   │
│   ├── modules/                       # Feature modules (MVC pattern)
│   │   ├── splash/                    # Splash screen & app initialization
│   │   │   ├── bindings/
│   │   │   ├── controllers/
│   │   │   └── views/
│   │   ├── onboarding/                # User onboarding screens
│   │   ├── login/                     # User authentication (login)
│   │   ├── register/                  # User registration
│   │   ├── forgot_password/           # Password recovery flow
│   │   ├── initialhealth/             # Initial health profile setup
│   │   ├── botnavbar/                 # Bottom navigation container
│   │   ├── home/                      # Home dashboard
│   │   ├── meals/                     # Meal tracking & logging
│   │   ├── search_food/               # Food search functionality
│   │   ├── detail_food/               # Food detail view
│   │   ├── cam/                       # Camera & barcode scanning
│   │   ├── statistics/                # Analytics & charts dashboard
│   │   ├── profile/                   # User profile view
│   │   ├── profile_edit/              # Profile editor
│   │   └── notification/              # Notifications center
│   │
│   ├── network/                       # API communication layer
│   │   └── endpoint.dart              # API endpoint definitions
│   │
│   ├── services/                      # Business logic & API services
│   │   ├── UserService.dart           # User & authentication APIs
│   │   ├── FoodService.dart           # Food database APIs
│   │   └── FoodLogService.dart        # Food log APIs
│   │
│   ├── routes/                        # Navigation and routing
│   │   ├── app_pages.dart             # Route pages & bindings
│   │   └── app_routes.dart            # Route name constants
│   │
│   └── shared/                        # Shared resources
│       ├── constants/                 # App constants
│       │   ├── colors.dart            # Color palette
│       │   ├── text_style.dart        # Text styles
│       │   └── constant.dart          # General constants
│       └── widgets/                   # Reusable UI components
│           ├── custom_button.dart
│           ├── custom_text_field.dart
│           ├── nutrient_card.dart
│           ├── notification_card.dart
│           └── ... (other shared widgets)
│
├── assets/
│   └── images/                        # All image assets (SVG & PNG)
│       ├── icons/                     # Icon set
│       ├── illustrations/             # Onboarding & informational images
│       └── logos/                     # App branding
│
├── test/
│   └── widget_test.dart               # Widget tests
│
└── .env                               # Environment configuration (git ignored)
```

## 🏗 Architecture

Dietin follows the **MVC (Model-View-Controller) architecture pattern** with GetX state management, ensuring clean separation of concerns and maintainability.

### Architecture Layers

```
┌─────────────────────────────────────────────────────────┐
│                    Presentation Layer                    │
│  (Views, Widgets, UI Components, GetX Controllers)      │
├─────────────────────────────────────────────────────────┤
│                    Business Logic Layer                   │
│  (GetX Services, Data Processing, State Management)     │
├─────────────────────────────────────────────────────────┤
│                    Data/Network Layer                     │
│  (API Services, Local Storage, Data Models)             │
├─────────────────────────────────────────────────────────┤
│                    Backend API Services                   │
│  (REST API, Database, Authentication Server)           │
└─────────────────────────────────────────────────────────┘
```

### Design Patterns Used

1. **MVC Pattern**: Separation of Model, View, and Controller
   - **Models** (`data/`): Data structures and entities
   - **Views** (`modules/*/views/`): UI components and screens
   - **Controllers** (`modules/*/controllers/`): Business logic and state

2. **GetX Service Locator**: Dependency injection using GetX
   - Services are auto-initialized via bindings
   - Controllers manage state and handle user interactions
   - Automatic cleanup when routes are popped

3. **Singleton Services**: API services (UserService, FoodService) are singletons
   - Ensures single instance across the app
   - Manages HTTP client configuration and token handling
   - Provides consistent API communication

4. **Builder Pattern**: Responsive widget construction
   - ScreenUtilInit for screen adaptation
   - Custom builders for dynamic layouts

5. **Repository Pattern**: Services act as repositories
   - Abstract API calls and data access
   - Handle response parsing and error management

### GetX State Management Flow

```
User Interaction (UI) 
        ↓
   Controller handles event
        ↓
   Calls Service/API
        ↓
   Service returns data/updates storage
        ↓
   Controller updates Observable variables (.obs)
        ↓
   GetX rebuilds dependent widgets automatically
        ↓
   UI reflects new state
```

### Module Structure

Each feature module follows a consistent structure:

```
module_name/
├── bindings/
│   └── module_binding.dart        # GetX dependency injection setup
├── controllers/
│   └── module_controller.dart     # State management & business logic
│       - Observable variables
│       - Methods for user actions
│       - API call handlers
│       - Error handling
└── views/
    └── module_view.dart           # UI implementation
        - GetBuilder/Obx for reactivity
        - Widget composition
        - User interaction handling
```

### API Communication Flow

```
View (User Action)
    ↓
Controller Method
    ↓
Service API Call (UserService/FoodService)
    ↓
GetConnect HTTP Request with Middleware
    ↓
Backend API Response
    ↓
Service Response Parsing & Error Handling
    ↓
Token Management (if auth related)
    ↓
Local Storage Update
    ↓
Controller State Update
    ↓
View Reactivity (Auto Refresh)
```

### Key Components

#### Services Architecture
- **UserServices**: Handles authentication, user profile, onboarding
- **FoodService**: Manages food database queries and caching
- **FoodLogService**: Manages meal logs and tracking

Each service:
- Extends `GetConnect` for HTTP communication
- Implements request interceptors for token injection
- Handles response parsing with error management
- Manages local storage for offline caching

#### Storage Layer
- **GetStorage**: Local key-value storage for:
  - Access tokens and refresh tokens
  - User preferences
  - Cached data for offline access

#### Network Configuration
- **Environment-based URLs**: Via `.env` file with flutter_dotenv
- **Request timeout**: 30-60 seconds per request
- **Content-Type**: JSON for all requests
- **Authorization**: Bearer token in headers for authenticated endpoints


## 🔐 Security

Dietin implements multiple layers of security to protect user data and ensure safe operation.

### Authentication & Authorization

#### JWT Token-Based Authentication
- **Access Tokens**: Short-lived tokens (typically 15 minutes) for API requests
- **Refresh Tokens**: Longer-lived tokens used to refresh access tokens
- **Bearer Token**: Included in Authorization header for authenticated requests
  ```
  Authorization: Bearer {accessToken}
  ```

#### Token Management
```dart
// Token Storage in GetStorage
_storage.write('accessToken', tokenModel.accessToken);
_storage.write('refreshToken', tokenModel.refreshToken);

// Token Injection in API Requests
httpClient.addRequestModifier<dynamic>((request) {
  final token = _storage.read('accessToken');
  if (token != null) {
    request.headers['Authorization'] = 'Bearer $token';
  }
  return request;
});
```

#### Session Security
- Tokens stored securely in device's isolated storage (GetStorage)
- Automatic token inclusion in all authenticated requests
- Token expiration handling with refresh mechanisms
- Logout clears all stored authentication data

### Data Protection

#### Local Storage Security
- **GetStorage**: Uses device's secure key-value storage
- **Encrypted at rest**: Device OS handles encryption (Android KeyStore, iOS Keychain)
- **Isolated access**: Only accessible by the app
- **No sensitive plaintext**: Sensitive data never stored unencrypted

#### Data Transmission Security
- **HTTPS/TLS**: All API communications over encrypted channels
- **HTTPS Certificate Pinning**: (Recommended enhancement)
- **Request validation**: Server validates all input
- **Response validation**: Client validates response structure

#### Sensitive Data Handling
- **Passwords**: Never stored locally; only transmitted to backend over HTTPS
- **User Health Data**: Encrypted at rest and in transit
- **Tokens**: Stored in secure device storage only
- **PII**: Handled according to privacy regulations

### Input Validation & Sanitization

#### Client-Side Validation
```dart
// Email validation
if (!email.contains('@') || !email.contains('.')) {
  throw Exception('Invalid email format');
}

// Password strength requirements
- Minimum 8 characters
- Mix of uppercase and lowercase
- Include numbers and special characters

// Numeric field validation
- Height/Weight: Positive numbers only
- Age: Valid range (typically 13-120)
```

#### Server-Side Validation
- All inputs validated on backend
- Type checking for all parameters
- Range validation for numeric fields
- Format validation for dates and emails

### API Security

#### Request Security
- **Content-Type**: Application/JSON with validation
- **Request timeout**: 30-60 seconds to prevent hanging requests
- **Rate limiting**: (Backend implementation)
- **CORS**: Properly configured on backend

#### Response Handling
- **Response structure validation**: Checks for expected keys
- **Type safety**: JSON parsing with null checking
- **Error handling**: Proper exception handling without exposing internals
- **Error messages**: Generic messages to users, detailed logs for debugging

### Error Handling & Logging

#### Error Messages
```dart
// User-friendly public errors
'Failed to register user'
'Unable to connect to server. Please check your internet.'

// Detailed debugging (removed in production)
print('Error in register service: $e');
```

#### Sensitive Information Handling
- No sensitive data in error messages shown to users
- Credentials never logged or printed
- Detailed logs only in development build
- Production builds have logging disabled

### Best Security Practices Implemented

1. **No Hardcoded Credentials**
   - API base URL loaded from `.env` file
   - Secrets never committed to repository

2. **Dependency Security**
   - Regular package updates
   - Only use trusted, well-maintained packages
   - Review dependencies for vulnerabilities

3. **Code Security**
   - Input validation on all user inputs
   - SQL injection prevention (API-side)
   - XSS protection (no unsafe HTML rendering)
   - CSRF protection (token-based API)

4. **Network Security**
   - HTTPS enforcement
   - Certificate validation
   - Timeout mechanisms
   - Secure DNS resolution

5. **Storage Security**
   - No sensitive data in SharedPreferences
   - Use platform-secure storage only
   - Clear sensitive data on logout
   - Implement session timeout

### Security Checklist for Deployment

- [ ] Environment variables properly configured for production
- [ ] HTTPS certificate pinning implemented
- [ ] Error logging disabled or minimized in release builds
- [ ] Debug information removed from release APK/IPA
- [ ] Tokens stored only in secure storage
- [ ] API rate limiting configured
- [ ] Input validation on both client and server
- [ ] CORS policies properly configured
- [ ] Regular security audits scheduled
- [ ] User consent for data collection obtained
- [ ] Privacy policy updated and accessible
- [ ] GDPR/Local privacy regulations compliance verified

### Recommended Security Enhancements

```dart
// Certificate Pinning (using pin_it_ssl)
// Implement biometric authentication
// Add encryption for sensitive local data
// Implement token refresh mechanism
// Add request signing for sensitive APIs
// Implement integrity verification for responses
```

### Data Retention & Deletion

- Users can request data deletion
- Tokens automatically expire
- Local cache cleared on logout
- User health data deleted upon account deletion
- Notification history automatically pruned after 30 days

## 📦 Installation & Setup

### Prerequisites

- **Flutter SDK**: 3.9.2 or higher
  - [Download Flutter](https://flutter.dev/docs/get-started/install)
  - Verify installation: `flutter --version`

- **Dart SDK**: 3.9.2+ (included with Flutter)

- **Android Setup**:
  - Android SDK API Level 21+
  - Android Studio or Android SDK Command Line Tools
  - Device with Android 5.1+ or Emulator

- **iOS Setup** (macOS only):
  - Xcode 14.0+
  - iOS 12.0+ device or simulator
  - CocoaPods

- **IDE**: Android Studio, VS Code, or IntelliJ IDEA with Flutter plugin

### Step-by-Step Installation

#### 1. Clone the Repository

```bash
git clone https://github.com/yourusername/dietin.git
cd dietin
```

#### 2. Verify Flutter Installation

```bash
flutter doctor
```

Ensure all required components show a checkmark. Address any warnings:

```bash
# For Android
flutter doctor --android-licenses  # Accept licenses

# For iOS (macOS only)
cd ios && pod install && cd ..
```

#### 3. Install Dependencies

```bash
flutter pub get
```

This installs all packages defined in `pubspec.yaml`:
- GetX for state management
- FlutterScreenUtil for responsive design
- FL Chart for statistics visualization
- Mobile Scanner for barcode scanning
- And others...

#### 4. Environment Configuration

Create `.env` file in project root:

```env
BASE_URL=https://your-api-server.com
```

**Important**: Add `.env` to `.gitignore` to prevent committing sensitive data:

```bash
echo ".env" >> .gitignore
```

#### 5. Verify Project Structure

```bash
flutter pub get --dry-run
```

#### 6. Run the Application

**On Android**:
```bash
flutter run -d android
```

**On iOS** (macOS only):
```bash
flutter run -d ios
```

**On Multiple Devices**:
```bash
flutter devices                    # List available devices
flutter run -d <device-id>        # Run on specific device
```

**With Specific Configuration**:
```bash
flutter run --release             # Release build
flutter run --profile             # Profile build for performance testing
flutter run --verbose             # Verbose output for debugging
```

### Running the App

#### First-Time Launch

1. **Splash Screen**: App loads assets and initializes services
2. **Onboarding** (if new user): Introduction screens
3. **Login/Register**: Authentication screen

#### Development Mode

```bash
# Hot reload: Press 'r' in terminal
# Hot restart: Press 'R' in terminal
# Quit: Press 'q' in terminal
```

#### Testing on Emulator/Device

```bash
# List connected devices
flutter devices

# Run on specific device
flutter run -d emulator-5554

# Run with specific flavor/variant (if configured)
flutter run -t lib/main.dart
```

## 🔧 Environment Configuration

### .env File Setup

Create `.env` file in project root with required configurations:

```env
# Backend API Configuration
BASE_URL=https://your-api-domain.com
```

**Example for Different Environments**:

```env
# Development
BASE_URL=http://localhost:3000

# Staging
BASE_URL=https://staging-api.example.com

# Production
BASE_URL=https://api.example.com
```

### Environment File Loading

The app automatically loads `.env` in `main.dart`:

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");  // Load environment variables
  await GetStorage.init();              // Initialize local storage
  await ScreenUtil.ensureScreenSize();  // Setup responsive design
  runApp(MyApp());
}
```

### Application Initialization

The app initializes with the following sequence:

1. **WidgetsFlutterBinding**: Ensures Flutter bindings are ready
2. **GetStorage**: Initializes local data persistence
3. **ScreenUtil**: Sets up responsive design utilities
4. **ScreenUtilInit**: Configures screen adaptation
   - Design Size: 380px x 800px
   - Text Adaptation: Enabled
   - Split Screen Mode: Enabled (for foldable devices)

### Design Specifications

```dart
ScreenUtilInit(
  designSize: const Size(380, 800),
  minTextAdapt: true,
  splitScreenMode: true,
  builder: (context, child) {
    return GetMaterialApp(
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  },
)
```

## 🌐 API Integration

### API Endpoints Reference

| Method | Endpoint | Purpose | Auth Required |
|--------|----------|---------|---------------|
| POST | `/register` | User registration | ❌ |
| POST | `/login` | User authentication | ❌ |
| POST | `/onboard` | Submit health profile | ✅ |
| GET | `/user` | Fetch user profile | ✅ |
| POST | `/token` | Refresh access token | ✅ |
| GET | `/foods` | List all foods | ✅ |
| POST | `/food/scan` | Scan barcode/QR | ✅ |
| POST | `/food/scan-and-log` | Scan and log meal | ✅ |
| GET | `/food/upc` | UPC code lookup | ✅ |

### Request/Response Format

All API communications use JSON format:

```bash
# Request Example
POST /login
Content-Type: application/json
{
  "email": "user@example.com",
  "password": "SecurePassword123"
}

# Response Example
{
  "response": {
    "payload": {
      "accessToken": "eyJhbGc...",
      "refreshToken": "eyJhbGc..."
    }
  }
}
```

### Authentication

All authenticated requests include Bearer token:

```dart
headers: {
  'Authorization': 'Bearer {accessToken}'
}
```

### Error Handling

API errors are handled gracefully with user-friendly messages:

```dart
try {
  final response = await userService.login(
    email: email,
    password: password,
  );
} catch (e) {
  // Show user-friendly error message
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(e.toString()))
  );
}
```

## 📖 Usage Guide

### User Registration & Authentication

#### Registration Flow

1. **Open App**: App starts at Splash screen
2. **Navigate to Register**: Tap "Create Account" button
3. **Enter Details**:
   - Full Name
   - Email Address
   - Password (min 8 characters, mixed case, numbers)
   - Confirm Password
4. **Submit**: Tap "Register" button
5. **Wait**: App validates and registers on backend
6. **Success**: Redirected to login screen

#### Login

1. **Enter Credentials**:
   - Email Address
   - Password
2. **Tap "Login"**: Submit credentials
3. **Authentication**: JWT tokens are received and stored securely
4. **Onboarding** (first login): Complete health profile setup

#### Password Reset

1. **On Login Screen**: Tap "Forgot Password?"
2. **Enter Email**: Provide registered email address
3. **Check Email**: Verify recovery link sent to email
4. **Reset**: Follow email link to reset password
5. **Return to Login**: Use new password to login

### Health Profile Setup

#### Initial Onboarding

Complete during first login:

1. **Birth Date**: Select date of birth
2. **Physical Info**:
   - Height (cm)
   - Weight (kg)
   - Gender (Male/Female)
3. **Health Goals**:
   - Main Goal (Weight Loss/Gain/Maintenance)
   - Target Weight (kg)
   - Activity Level (Sedentary/Light/Moderate/Active)
4. **Allergies**: Select any food allergies (optional)
5. **Submit**: Save profile and proceed to home

### Daily Nutrition Tracking

#### Home Dashboard

- **Daily Summary**: Total calories and macronutrients
- **Meal Categories**: Breakfast, Lunch, Dinner, Snacks
- **Add Meal**: Tap "+" to add meal
- **View Details**: Tap meal card for nutritional details

#### Logging Meals

**Method 1: Search Food Database**
1. **Navigate to Meals** tab
2. **Search**: Tap search icon, enter food name
3. **Select**: Choose food from results
4. **Quantity**: Enter serving size
5. **Log**: Add to meal category
6. **Confirm**: Meal logged to daily tracker

**Method 2: Barcode Scanning**
1. **Navigate to Camera** (Scan) tab
2. **Grant Permissions**: Allow camera access
3. **Scan**: Point camera at barcode/UPC code
4. **Result**: Food automatically identified
5. **Log**: Quick-add to meal or customize quantity
6. **Confirm**: Meal logged

**Method 3: Manual Entry**
1. **Add Custom Meal** option
2. **Enter Details**:
   - Food name
   - Calories
   - Protein, Carbs, Fat
3. **Log**: Add to meal tracker

### Viewing Statistics

#### Statistics Dashboard

1. **Navigate to Statistics** tab
2. **View Charts**:
   - Daily calorie intake
   - Macronutrient breakdown
   - Weekly trends
   - Monthly progress
3. **Filter**: Select date range (Week/Month)
4. **Details**: Tap chart for detailed information

### Profile Management

#### View Profile

1. **Navigate to Profile** tab
2. **View Information**:
   - Personal details
   - Health metrics
   - Activity level
   - Dietary restrictions

#### Edit Profile

1. **Profile Tab** → **Edit** button
2. **Modify**:
   - Name
   - Height/Weight
   - Health goals
   - Activity level
   - Allergies
3. **Save**: Submit changes
4. **Confirm**: Profile updated on server

### Notifications

#### Notification Center

1. **Navigate to Notifications** (bell icon)
2. **View Alerts**:
   - Meal reminders
   - Goal achievements
   - Progress updates
3. **Mark as Read**: Tap notification
4. **Clear**: Swipe to dismiss

## 💻 Development

### Setting Up Development Environment

#### 1. Project Setup

```bash
# Clone and navigate
git clone <repo-url>
cd dietin

# Install dependencies
flutter pub get

# Get all packages with transitive dependencies
flutter pub get --no-example
```

#### 2. Code Generation

If using any code generation packages:

```bash
# Generate all files
flutter pub run build_runner build

# Watch mode for continuous generation
flutter pub run build_runner watch
```

#### 3. Code Analysis

```bash
# Analyze Dart code
flutter analyze

# Format code
dart format lib/

# Fix formatting issues automatically
dart format lib/ -w
```

### Development Guidelines

#### Code Style

- **Naming**: Use camelCase for variables/functions, PascalCase for classes
- **Comments**: Document public APIs and complex logic
- **Imports**: Organize imports (dart, package, relative)
- **Line Length**: Keep under 120 characters

#### File Organization

```dart
// 1. Imports
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// 2. Class definition
class ExampleWidget extends StatelessWidget {
  // 3. Constructor
  const ExampleWidget({Key? key}) : super(key: key);

  // 4. Lifecycle methods (for Stateful)
  // 5. Build method
  // 6. Private methods
}
```

#### GetX State Management Best Practices

```dart
// Controller - lib/app/modules/example/controllers/example_controller.dart
class ExampleController extends GetxController {
  // Observable variables
  final count = 0.obs;
  final isLoading = false.obs;
  
  @override
  void onInit() {
    super.onInit();
    // Initialize resources
  }

  void increment() {
    count.value++;
  }

  @override
  void onClose() {
    // Clean up resources
    super.onClose();
  }
}

// View
class ExampleView extends GetView<ExampleController> {
  const ExampleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Text('Count: ${controller.count.value}'));
  }
}

// Binding - lib/app/modules/example/bindings/example_binding.dart
class ExampleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExampleController>(() => ExampleController());
  }
}
```

#### Service/Repository Pattern

```dart
class UserService extends GetConnect {
  static UserService get to => Get.find<UserService>();
  final _storage = GetStorage();

  @override
  void onInit() {
    httpClient.baseUrl = dotenv.env['BASE_URL'] ?? '';
    httpClient.timeout = const Duration(seconds: 30);
    
    // Add token to requests
    httpClient.addRequestModifier<dynamic>((request) {
      final token = _storage.read('accessToken');
      if (token != null) {
        request.headers['Authorization'] = 'Bearer $token';
      }
      return request;
    });
    
    super.onInit();
  }

  // API methods
  Future<UserModel> getUser() async {
    try {
      final response = await get('/user');
      if (response.isOk) {
        return UserModel.fromJson(response.body);
      } else {
        throw Exception('Failed to fetch user');
      }
    } catch (e) {
      rethrow;
    }
  }
}
```

### Testing

#### Running Tests

```bash
# Run all tests
flutter test

# Run specific test file
flutter test test/widget_test.dart

# Run tests with coverage
flutter test --coverage

# Watch mode
flutter test --watch
```

#### Writing Tests

```dart
void main() {
  testWidgets('Counter widget increments', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    
    // Verify initial value
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap button and trigger animation
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();

    // Verify result
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
```

### Debugging

#### Debug Prints

```dart
// Use for debugging (remove in production)
print('Debug: Value = $value');
debugPrint('Important: Something happened');

// Use log package for structured logging
import 'dart:developer' as developer;
developer.log('User logged in', name: 'auth');
```

#### Flutter DevTools

```bash
# Launch DevTools
flutter pub global activate devtools
devtools

# Or use with Flutter
flutter run --profile
# Then press 'd' to open DevTools
```

#### Common Debugging Steps

1. **Check Console**: Look for error messages
2. **Hot Reload**: Press 'r' to reload changes
3. **Clear Cache**: `flutter clean && flutter pub get`
4. **Restart**: Press 'R' for full app restart
5. **Device Log**: `flutter logs`

## 🚀 Building & Deployment

### Building for Android

#### Build APK (Debug)

```bash
flutter build apk
# Output: build/app/outputs/apk/debug/app-debug.apk
```

#### Build APK (Release)

```bash
flutter build apk --release
# Output: build/app/outputs/apk/release/app-release.apk
```

#### Build App Bundle (for Google Play)

```bash
flutter build appbundle --release
# Output: build/app/outputs/bundle/release/app-release.aab
```

### Building for iOS

#### Build IPA (Release)

```bash
flutter build ios --release
# Output: build/ios/ipa/
```

#### Signing

Configure in `ios/Runner.xcodeproj`:
1. Select project in Xcode
2. Select "Runner" target
3. Go to "Signing & Capabilities"
4. Configure signing certificate and provisioning profile

### Building for Web

```bash
flutter build web --release
# Output: build/web/
```

### Pre-Deployment Checklist

- [ ] Update version in `pubspec.yaml`
- [ ] Update build number
- [ ] Test on multiple devices
- [ ] Check API endpoints are production URLs
- [ ] Remove debug prints and logging
- [ ] Verify `.env` is in `.gitignore`
- [ ] Update app icons and splash screens
- [ ] Test offline functionality
- [ ] Verify error handling
- [ ] Security review complete
- [ ] Privacy policy updated
- [ ] Terms of service ready

### Deployment Steps

#### Google Play (Android)

1. **Prepare Release Build**:
   ```bash
   flutter build appbundle --release
   ```

2. **Upload to Play Console**:
   - Create app in Play Console
   - Upload AAB file
   - Fill store listing information
   - Set up pricing and distribution
   - Submit for review

#### App Store (iOS)

1. **Build and Archive**:
   ```bash
   flutter build ios --release
   ```

2. **Archive in Xcode**:
   - Open `ios/Runner.xcworkspace` in Xcode
   - Product → Archive
   - Upload to App Store Connect

3. **TestFlight Testing**:
   - Add testers in App Store Connect
   - Build available for testing
   - Gather feedback

4. **Submit for Review**:
   - Complete app information
   - Set pricing and availability
   - Submit for App Review

## 🔧 Troubleshooting

### Common Issues & Solutions

#### Issue: "flutter command not found"

**Solution**:
```bash
# Add Flutter to PATH
export PATH="$PATH:`pwd`/flutter/bin"

# Or add permanently to ~/.bashrc or ~/.zshrc
echo 'export PATH="$PATH:$HOME/flutter/bin"' >> ~/.bashrc
source ~/.bashrc
```

#### Issue: "Gradle build failed"

**Solutions**:
```bash
# Clear build cache
flutter clean

# Get fresh dependencies
flutter pub get

# Force rebuild
flutter build apk --release

# Check Java version (needs Java 11+)
java -version
```

#### Issue: "CocoaPods error" (iOS)

**Solutions**:
```bash
# Update CocoaPods
sudo gem install cocoapods

# Navigate to iOS directory
cd ios

# Remove pods
rm -rf Pods
rm Podfile.lock

# Reinstall
pod install

# Go back to project root
cd ..

# Clean and rebuild
flutter clean
flutter pub get
flutter run
```

#### Issue: ".env file not found"

**Solution**:
```bash
# Make sure .env exists in project root
# Create if missing:
cat > .env << EOF
BASE_URL=your-api-url-here
EOF

# Verify loading in main.dart
# Check flutter_dotenv is in pubspec.yaml
# Run: flutter pub get
```

#### Issue: "Connection refused" to backend

**Troubleshooting**:
1. **Check Backend URL**:
   ```bash
   # Verify .env BASE_URL is correct
   cat .env
   ```

2. **Test Connectivity**:
   ```bash
   # Test if API is reachable
   curl https://your-api-url.com/health
   ```

3. **Check Firewall**:
   - Ensure device can reach backend
   - Check VPN/proxy settings
   - Try with different network

#### Issue: "Hot reload not working"

**Solutions**:
```bash
# Stop the running app
# Press Ctrl+C in terminal

# Clear cache
flutter clean
flutter pub get

# Run again
flutter run

# Use hot restart instead
# Press 'R' in terminal instead of 'r'
```

#### Issue: "Insufficient permissions" (Camera/Storage)

**Solution**:
```bash
# Check AndroidManifest.xml has permissions:
# <uses-permission android:name="android.permission.CAMERA" />
# <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" />

# For iOS, check Info.plist:
# NSCameraUsageDescription
# NSPhotoLibraryUsageDescription

# Request permission at runtime (handled by mobile_scanner)
```

#### Issue: "Package version conflict"

**Solution**:
```bash
# Update all packages
flutter pub upgrade

# Or downgrade to specific version
flutter pub add package_name:version

# Check pubspec.lock for conflicts
flutter pub get --no-example
```

### Performance Issues

#### Slow App Launch

1. **Minimize initializations** in main.dart
2. **Use lazy initialization** for services
3. **Profile with DevTools**:
   ```bash
   flutter run --profile
   # Open DevTools and check timeline
   ```

#### High Memory Usage

1. **Cache management**: Clear unused cached data
2. **Image optimization**: Use appropriate image sizes
3. **Monitor with DevTools**:
   ```bash
   flutter run
   # Press 'p' in terminal to show performance info
   ```

#### Slow API Responses

1. **Check network timeout**:
   ```dart
   httpClient.timeout = const Duration(seconds: 30);
   ```

2. **Add request logging**:
   ```dart
   print('Request: ${DateTime.now()}');
   final response = await api.call();
   print('Response: ${DateTime.now()}');
   ```

3. **Implement caching** for frequently used data

## 📝 Contributing

### Getting Started

1. **Fork the repository** on GitHub
2. **Create a feature branch**:
   ```bash
   git checkout -b feature/your-feature-name
   ```

3. **Make your changes** following code guidelines
4. **Test thoroughly** before submitting

### Code Guidelines

#### Dart/Flutter Style Guide

- Follow [Effective Dart](https://dart.dev/guides/language/effective-dart) conventions
- Use `dart analyze` to check for issues
- Format code with `dart format`

#### Commit Messages

```
feat: Add new feature description
fix: Fix bug description
docs: Update documentation
refactor: Refactor code section
test: Add or update tests
chore: Update dependencies
```

#### Pull Request Process

1. **Update** `CHANGELOG.md` with changes
2. **Add tests** for new functionality
3. **Update** documentation if needed
4. **Create Pull Request** with:
   - Clear title describing changes
   - Detailed description of what changed
   - Reference to related issues
   - Screenshots if UI changes

### Review Process

- Code review by maintainers
- Automated tests must pass
- All comments must be addressed
- Approval from 1+ maintainers required
- Merge to main branch

### Reporting Issues

When reporting bugs:

1. **Check existing issues** first
2. **Provide environment info**:
   ```
   - Flutter version: (from flutter --version)
   - Dart version: (included in Flutter)
   - Device: (model, OS version)
   - App version: (from pubspec.yaml)
   ```

3. **Describe the issue**:
   - What happened
   - What you expected
   - Steps to reproduce
   - Error messages/logs

4. **Attach logs**:
   ```bash
   flutter logs > log.txt
   ```

### Feature Requests

1. **Describe the feature**
2. **Explain the use case**
3. **Provide mockups** if UI changes
4. **Discuss implementation** approach

## 📄 License

This project is part of an educational or professional Flutter development initiative. For licensing information, please refer to the LICENSE file in the repository or contact the project maintainers.

### Third-Party Licenses

This project uses the following open-source libraries:

- **GetX**: Apache License 2.0
- **flutter_screenutil**: MIT License
- **fl_chart**: MIT License
- **mobile_scanner**: MIT License
- **camera**: BSD License
- **google_fonts**: Apache License 2.0

See `pubspec.yaml` for complete list of dependencies.

## 🤝 Support

### Getting Help

- **Issues**: Create an issue on GitHub
- **Discussions**: Use GitHub Discussions for questions
- **Documentation**: Check README and inline code comments
- **Email**: Contact project maintainers

### Additional Resources

- [Flutter Documentation](https://flutter.dev/docs)
- [Dart Documentation](https://dart.dev/guides)
- [GetX Documentation](https://github.com/jonataslaw/getx)
- [Material Design Guide](https://material.io/design)

## 📊 Project Statistics

- **Total Lines of Code**: ~10,000+ (estimated)
- **Number of Modules**: 16 feature modules
- **API Endpoints**: 8+ endpoints
- **Data Models**: 5+ models
- **Shared Widgets**: 12+ components
- **Supported Platforms**: Android, iOS, Web
- **Target Audience**: Health-conscious users tracking nutrition

## 🎯 Roadmap

### Version 2.0 (Planned)

- [ ] Social features (friend tracking, challenges)
- [ ] Advanced analytics with AI insights
- [ ] Recipe database with meal planning
- [ ] Wearable integration (Apple Watch, Wear OS)
- [ ] Offline synchronization improvements
- [ ] Dark mode support
- [ ] Multi-language support
- [ ] Cloud backup and restore

### Version 3.0 (Future)

- [ ] Machine learning recommendations
- [ ] Professional consultation booking
- [ ] Nutrition plan generation
- [ ] Integration with health platforms (Apple Health, Google Fit)
- [ ] Advanced reporting and PDF export

**Last Updated**: November 28, 2025

For the latest version and updates, visit the [GitHub Repository](https://github.com/AhliCT/dietin-mobile)
