# GuessIt Task - Flutter Application

A modern Flutter application for job searching and management with advanced features like biometric authentication, notifications, and region-based content.

## Project Structure

The project follows a clean architecture pattern with feature-based organization:

```
lib/
├── core/
│   ├── constants/
│   ├── theme/
│   ├── utils/
│   └── widgets/
│
├── features/
│   ├── auth/
│   │   ├── data/
│   │   │   ├── datasources/
│   │   │   └── repositories/
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   ├── repositories/
│   │   │   └── usecases/
│   │   └── presentation/
│   │       ├── controllers/
│   │       ├── pages/
│   │       └── widgets/
│   │
│   ├── search/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   │
│   ├── notifications/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   │
│   ├── onboarding/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   │
│   └── region/
│       ├── data/
│       ├── domain/
│       └── presentation/
│
└── main.dart
```

## Features

### Authentication
- Email/Password login
- Google Sign-In
- Biometric authentication
- Region selection
- Secure token management

### Search
- Advanced job search functionality
- Filter options (work type, job level, location, salary)
- Saved searches
- Job recommendations

### Notifications
- Real-time job alerts
- Application status updates
- Customizable notification preferences

### Onboarding
- User experience selection
- Guided setup process
- Region-based content

### Region Management
- Country/Region selection
- Location-based services
- Regional preferences

## Technical Stack

- **Flutter**: UI framework
- **Firebase**: Authentication and backend services
- **Provider**: State management
- **GetIt**: Dependency injection
- **GoRouter**: Navigation
- **Local Auth**: Biometric authentication
- **Shared Preferences**: Local storage
- **Flutter SVG**: SVG image handling

## Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.2
  flutter_svg: ^2.0.9
  provider: ^6.1.1
  firebase_core: ^3.13.0
  firebase_auth: ^5.5.2
  google_sign_in: ^6.1.6
  flutter_bloc: ^8.1.3
  equatable: ^2.0.5
  formz: ^0.5.0
  get_it: ^7.6.4
  go_router: ^13.2.0
  image_picker: ^1.0.7
  intl: ^0.18.1
  local_auth: ^2.1.8
  shared_preferences: ^2.2.2
  country_code_picker: ^2.0.2
```

## Getting Started

1. Clone the repository
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Configure Firebase:
   - Add your Firebase configuration files
   - Enable required Firebase services
4. Run the application:
   ```bash
   flutter run
   ```

## Architecture

The application follows Clean Architecture principles:

1. **Presentation Layer**
   - UI Components
   - Controllers/Blocs
   - View Models

2. **Domain Layer**
   - Business Logic
   - Entities
   - Use Cases
   - Repository Interfaces

3. **Data Layer**
   - Repository Implementations
   - Data Sources
   - API Clients
   - Local Storage

## Best Practices

- Clean Architecture implementation
- Dependency Injection using GetIt
- State Management with Provider
- Responsive UI design
- Secure authentication flow
- Error handling and logging
- Unit testing and widget testing

## Contributing

1. Fork the repository
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.
