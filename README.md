
# 🐶 DogApp – Konfío Mobile Engineer Challenge

DogApp is a SwiftUI-based application developed as part of a technical challenge. It fetches a list of dogs from a public API and presents them in a clean, responsive interface. The app also implements local persistence using SwiftData to improve performance and enable offline access.

## 📱 Features

- ✅ Dog list with name, description, image, and age.
- ✅ Reactive UI using SwiftUI.
- ✅ Clean Architecture with clear separation of concerns.
- ✅ Data persistence using **SwiftData**.
- ✅ Support for multiple UI states: loading, success, error, and empty.
- ✅ Dependency injection via `AppEnvironment`.
- ✅ Unit test support with mock injection.
- ✅ UI Testing ready via launch arguments.

## 🧱 Architecture

The project follows Clean Architecture principles, with well-defined layers:

![DogApp Clean Architecture Diagram](./Screenshot_2025-06-07_at_11.33.22_pm.png)

- **UI Layer:** SwiftUI views (`DogsListView`, `DogCardView`) reacting to ViewModel state.
- **ViewModel:** Handles presentation logic and interacts with the use case.
- **UseCase:** Business logic via `FetchDogsUseCase`.
- **Repository:** Central interface for data access, combining remote and local sources.
- **DataSources:** Split between `DogRemoteDataSource` and `DogLocalDataSource`.
- **Storage:** Data is persisted locally using `SwiftDataStorage`.

## 🧪 Testing

UI states can be triggered via launch arguments:

| State        | Launch Argument             |
|--------------|-----------------------------|
| Success      | `-UITEST_SUCCESS_STATE`     |
| Error        | `-UITEST_ERROR_STATE`       |
| Empty        | `-UITEST_EMPTY_STATE`       |
| Loading      | `-UITEST_LOADING_STATE`     |

Mocks are included for all layers:
- `MockFetchDogsUseCase`
- `MockDogRemoteDataSource`
- `MockDogLocalDataSource`

## 🖼️ UI Design

Color usage follows the provided design:

| Element         | Color     |
|-----------------|-----------|
| Primary text    | `#333333` |
| Secondary text  | `#666666` |
| Card background | `#F8F8F8` |

## 🔗 Endpoint

```
GET https://jsonblob.com/api/1151549092634943488
```

## 💾 Persistence

- On first launch, data is fetched from the remote API and stored locally.
- On subsequent launches, data is retrieved from **SwiftData**.

## 🛠 Requirements

- Xcode 15.3+
- iOS 17+
- Swift 5.9+

## 🚀 Run the Project

1. Clone the repository
2. Open `DogApp.xcodeproj`
3. Run on iOS Simulator
4. Add launch arguments to simulate different UI states

## 📬 Final Notes

The app was built prioritizing clean, testable code and scalability. SwiftData was chosen over UserDefaults for a modern persistence layer.

---
