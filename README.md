# Flutter Base Provider Project

A comprehensive Flutter base project with Provider state management, featuring a modern architecture, theme switching, API integration, and best practices for scalable app development.

## 🚀 Features

### Core Features
- **Provider State Management** - Clean and efficient state management using Provider package
- **Dynamic Theme Switching** - Light, Dark, and System theme support with persistent storage
- **Responsive Design** - Adaptive UI that works across different screen sizes
- **Multi-Platform Support** - Android, iOS, Web, Windows, macOS, and Linux
- **Environment Configuration** - Flexible environment setup with .env file support
- **Network Management** - Comprehensive internet connectivity monitoring and API handling

### UI/UX Features
- **Material Design 3** - Modern Material Design implementation
- **Custom Fonts** - Poppins font family integration
- **SVG Icon Support** - Scalable vector graphics for crisp icons
- **Shimmer Loading** - Elegant loading animations
- **Custom Components** - Reusable UI components and extensions
- **Theme-Aware Components** - All components automatically adapt to theme changes

### Development Features
- **Code Quality** - Flutter lints and analysis options for clean code
- **Extension Methods** - Custom extensions for common operations
- **Helper Classes** - Utility classes for common functionality
- **Constants Management** - Centralized constant definitions
- **Error Handling** - Comprehensive error handling and user feedback

## 🏗️ Project Structure

```
flutter_base_provider/
├── android/                 # Android platform-specific code
├── ios/                     # iOS platform-specific code
├── web/                     # Web platform-specific code
├── windows/                 # Windows platform-specific code
├── macos/                   # macOS platform-specific code
├── linux/                   # Linux platform-specific code
├── assets/                  # App assets
│   ├── fonts/              # Custom fonts (Poppins family)
│   ├── icons/              # SVG icons
│   └── images/             # Image assets
├── lib/                     # Main Dart source code
│   ├── data/               # Data layer
│   │   ├── db/            # Local storage (SharedPreferences)
│   │   ├── model/         # Data models
│   │   └── repository/    # API repository
│   ├── helper/             # Helper utilities
│   ├── provider/           # State management providers
│   ├── utils/              # Utility classes and constants
│   └── view/               # UI layer
│       ├── screens/        # App screens
│       └── widgets/        # Reusable widgets
├── test/                    # Test files
├── pubspec.yaml            # Dependencies and project configuration
└── README.md               # Project documentation
```

## 📱 Screens

### Authentication Screens
- **Login Screen** - User authentication interface
- **Splash Screen** - App initialization and loading

### Main App Screens
- **Main Screen** - Container for bottom navigation
- **Home Screen** - Primary app interface with theme toggle
- **Menu Screen** - Secondary navigation interface
- **Theme Demo Screen** - Theme switching demonstration

## 🔧 Configuration

### Dependencies

#### Core Dependencies
- **Flutter SDK**: ^3.8.1
- **Provider**: ^6.1.5 - State management
- **Dio**: ^5.7.0 - HTTP client for API calls
- **Shared Preferences**: ^2.3.2 - Local data storage
- **Connectivity Plus**: Internet connectivity monitoring
- **Internet Connection Checker Plus**: Active internet connection verification

#### UI Dependencies
- **Flutter SVG**: ^2.0.10+1 - SVG rendering
- **Shimmer**: ^3.0.0 - Loading animations
- **Cupertino Icons**: ^1.0.8 - iOS-style icons

#### Utility Dependencies
- **Intl**: ^0.19.0 - Internationalization and formatting
- **Flutter Dotenv**: ^5.1.0 - Environment variable management

### Development Dependencies
- **Flutter Test**: Testing framework
- **Flutter Lints**: ^5.0.0 - Code quality and style enforcement

## 🎨 Theme System

### Theme Modes
- **Light Theme**: Clean, bright interface with white backgrounds
- **Dark Theme**: Easy-on-the-eyes dark interface
- **System Theme**: Automatically follows device theme preference

### Color Scheme
- **Primary Colors**: Azure blue (light) / Green (dark)
- **Surface Colors**: White (light) / Black (dark)
- **Text Colors**: Black (light) / White (dark)
- **Accent Colors**: Green, Red for various states

### Theme Features
- **Persistent Storage**: Theme preference saved locally
- **Dynamic Switching**: Real-time theme changes without app restart
- **Material Design 3**: Modern design system implementation
- **Custom Components**: All components automatically adapt to theme

## 🔌 API Integration

### HTTP Client (Dio)
- **Base Configuration**: Centralized Dio setup with timeout handling
- **Request Methods**: GET, POST, PUT, DELETE, Multipart
- **Authentication**: Bearer token support
- **Error Handling**: Comprehensive error handling with user feedback
- **Progress Tracking**: Upload/download progress monitoring

### API Repository
- **Centralized API Logic**: All API calls managed in one place
- **Response Handling**: Consistent response processing
- **Error Management**: Standardized error handling across the app
- **Token Management**: Automatic token inclusion in requests

### Environment Configuration
- **Environment Variables**: .env file support for different environments
- **API Endpoints**: Configurable base URLs and endpoints
- **Environment Detection**: Development, staging, production support

## 💾 Data Management

### Local Storage
- **SharedPreferences**: Persistent local data storage
- **User Data**: Login state, user information, tokens
- **Theme Preferences**: Theme mode persistence
- **FCM Tokens**: Push notification token storage

### Data Models
- **Authentication Models**: Login, forgot password data structures
- **Connection Models**: Network status and connectivity data
- **Radio List Models**: Selection list data structures

## 🧭 Navigation

### Routing System
- **Named Routes**: Clean and maintainable routing
- **Route Constants**: Centralized route definitions
- **Navigation Helper**: Utility functions for navigation

### Bottom Navigation
- **Custom Design**: Rounded corners with shadow effects
- **Theme Integration**: Colors automatically adapt to theme
- **State Management**: Provider-based navigation state
- **Smooth Transitions**: Animated navigation between tabs

## 🔗 Network Management

### Connection Manager
- **Real-time Monitoring**: Continuous internet connectivity tracking
- **Active Connection Check**: Verifies actual internet access
- **User Feedback**: Informs users about connection status
- **Error Handling**: Graceful handling of network issues

### Network Features
- **Connectivity Detection**: WiFi, mobile, and no connection states
- **Internet Validation**: Ensures actual internet access, not just network presence
- **Stream-based Updates**: Real-time connection status updates
- **User Notifications**: Clear feedback about network issues

## 🎯 State Management

### Provider Architecture
- **ThemeProvider**: Manages app theme state and persistence
- **HomeProvider**: Handles home screen state and logic
- **BottomNavigationProvider**: Manages navigation state
- **AuthProvider**: Handles authentication state

### State Features
- **Change Notifier**: Efficient state updates
- **Persistence**: State saved across app sessions
- **Reactive UI**: Automatic UI updates on state changes
- **Clean Architecture**: Separation of concerns

## 🛠️ Development Tools

### Code Quality
- **Flutter Lints**: Enforces coding standards
- **Analysis Options**: Customized analysis rules
- **Extension Methods**: Custom utility extensions
- **Helper Classes**: Reusable utility functions

### Utilities
- **Date Formatting**: Custom date formatting utilities
- **Input Validation**: Form validation helpers
- **Debouncing**: Input debouncing for performance
- **Scroll Behavior**: Custom scroll behavior customization

## 📱 Platform Support

### Mobile Platforms
- **Android**: Full support with Material Design
- **iOS**: Native iOS look and feel with Cupertino components

### Desktop Platforms
- **Windows**: Windows-specific optimizations
- **macOS**: Native macOS integration
- **Linux**: Linux desktop support

### Web Platform
- **Web**: Responsive web application
- **PWA Ready**: Progressive web app capabilities

## 🚀 Getting Started

### Prerequisites
- Flutter SDK ^3.8.1
- Dart SDK ^3.8.1
- Android Studio / VS Code
- Git

### Installation
1. Clone the repository
   ```bash
   git clone <repository-url>
   cd flutter_base_provider
   ```

2. Install dependencies
   ```bash
   flutter pub get
   ```

3. Set up environment variables
   - Create a `.env` file in the root directory
   - Add your API configuration:
     ```
     API_BASE_URL=your_api_base_url
     API_LOGIN_URL=/auth/login
     API_FORGOT_PASSWORD_URL=/auth/forgot-password
     API_REGISTER_URL=/auth/register
     ENVIRONMENT=development
     ```

4. Run the app
   ```bash
   flutter run
   ```

## 🔧 Configuration Files

### Analysis Options
- **analysis_options.yaml**: Code analysis and linting rules
- **Custom Lints**: Project-specific coding standards

### Build Configuration
- **Android**: Gradle configuration with Kotlin
- **iOS**: Xcode project configuration
- **Web**: Web-specific build settings
- **Desktop**: Platform-specific build configurations

## 📚 Usage Examples

### Theme Switching
```dart
// Access theme provider
final themeProvider = Provider.of<ThemeProvider>(context, listen: false);

// Switch themes
themeProvider.setThemeMode(AppThemeMode.dark);
themeProvider.toggleTheme();

// Get current theme
final isDark = themeProvider.isDarkMode;
```

### API Calls
```dart
// Make API request
final response = await ApiRepo().postRequest(
  url: 'https://api.example.com/endpoint',
  data: {'key': 'value'},
);

// Handle response
if (response != null) {
  // Process successful response
}
```

### Local Storage
```dart
// Store data
await LocalDb.storeBearerToken('your_token');
await LocalDb.storeUserData(userData);

// Retrieve data
final token = await LocalDb.getBearerToken;
final userData = await LocalDb.getUserData;
```

## 🧪 Testing

### Test Structure
- **Widget Tests**: UI component testing
- **Unit Tests**: Business logic testing
- **Integration Tests**: End-to-end testing

### Running Tests
```bash
# Run all tests
flutter test

# Run specific test file
flutter test test/widget_test.dart

# Run with coverage
flutter test --coverage
```

## 📦 Building

### Android
```bash
flutter build apk --release
flutter build appbundle --release
```

### iOS
```bash
flutter build ios --release
```

### Web
```bash
flutter build web --release
```

### Desktop
```bash
flutter build windows --release
flutter build macos --release
flutter build linux --release
```

## 🚀 Deployment

### Android
- Generate signed APK/Bundle
- Upload to Google Play Console
- Configure release signing

### iOS
- Archive in Xcode
- Upload to App Store Connect
- Configure provisioning profiles

### Web
- Deploy to hosting service
- Configure domain and SSL
- Set up CDN if needed

## 🤝 Contributing

### Development Workflow
1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests if applicable
5. Submit a pull request

### Code Standards
- Follow Flutter style guide
- Use meaningful commit messages
- Add documentation for new features
- Ensure all tests pass

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 🆘 Support

### Documentation
- [Flutter Documentation](https://flutter.dev/docs)
- [Provider Package](https://pub.dev/packages/provider)
- [Dio HTTP Client](https://pub.dev/packages/dio)

### Issues
- Report bugs via GitHub Issues
- Request features via GitHub Discussions
- Ask questions via GitHub Discussions

## 🔮 Future Enhancements

### Planned Features
- **Internationalization**: Multi-language support
- **Push Notifications**: Firebase integration
- **Analytics**: User behavior tracking
- **Crash Reporting**: Error monitoring
- **CI/CD**: Automated testing and deployment
- **Code Generation**: Build-time code generation
- **State Persistence**: Enhanced state persistence
- **Offline Support**: Offline-first architecture

### Architecture Improvements
- **Repository Pattern**: Enhanced data layer
- **Dependency Injection**: Better service management
- **Bloc Pattern**: Alternative state management
- **Microservices**: Backend service architecture

### Contact Information
- **Repository**: [GitHub](https://github.com/Saymmughal/flutter_base_provider/flutter_base_riverpod)
- **Issues**: [GitHub Issues](https://github.com/Saymmughal/flutter_base_provider/issues)
- **Email**: Saimmirzapk@gmail.com


---

**Built with ❤️ using Flutter and Provider**

*This project serves as a solid foundation for building scalable Flutter applications with modern architecture patterns and best practices.*
