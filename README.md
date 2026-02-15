# 🛍️ Swift Shop - Modern E-Commerce App

Swift Shop is a fully functional mobile e-commerce application built with **Flutter**, designed with clean architecture principles and a modern UI approach.

This project demonstrates core mobile development concepts including REST API integration, dynamic state management, complex UI structures, and unit testing.

## 📱 Screenshots

<img width="365" height="797" alt="home_screen" src="https://github.com/user-attachments/assets/83783c9f-1ade-4dfb-8670-fd764254a66a" />
<img width="381" height="817" alt="home_screen_with_search" src="https://github.com/user-attachments/assets/3cbf545b-95f9-4ce1-b3c9-862610e5c03e" />
<img width="377" height="816" alt="details_screen" src="https://github.com/user-attachments/assets/ec933113-a484-41ce-a660-b51486420ae3" />
<img width="387" height="817" alt="cart_screen" src="https://github.com/user-attachments/assets/931347c5-e686-4641-84f4-93e7491643c0" />
<img width="387" height="825" alt="empty_cart_screen" src="https://github.com/user-attachments/assets/40e59bc1-120f-401e-a90d-85bc892a648e" />

## ✨ Key Features

* **Modern UI/UX:** A minimalist design featuring a custom "Dark/Light" theme compatible color palette (Orange & Navy Blue).
* **Dynamic Data:** Real-time product fetching using `FakeStoreAPI`.
* **Advanced Search:** Custom search bar widget with instant filtering capabilities.
* **Smart Cart System:**
    * Add/Remove items dynamically.
    * Quantity management (+/- controls).
    * Automatic total price calculation.
    * Real-time cart badge notifications.
* **Component-Based Architecture:** Modular widget structure (`ProductCard`, `CartItem`, `HomeBanner`) for reusability.
* **Unit Testing:** Integrated tests to ensure data model integrity.

## 🛠️ Tech Stack

* **Language:** [Dart](https://dart.dev/)
* **Framework:** [Flutter](https://flutter.dev/) (v3.x)
* **Networking:** `http` package for RESTful API requests.
* **State Management:** `setState` (Optimized for performance).
* **Architecture:** MVC (Model-View-Controller) pattern.
* **Assets:** Managed via `flutter_native_splash` and `flutter_launcher_icons`.

## 📂 Project Structure

lib/
├── models/          # Data models (Product, etc.)
├── screens/         # UI Screens (Home, Detail, Cart)
├── services/        # API Service logic
├── widgets/         # Reusable UI Components
└── main.dart        # Entry point & Theme configuration

## 🚀 Getting Started

To run this project locally:

1.  **Clone the repository:**
    ```bash
    git clone [https://github.com/enescelik00/flutter-application-software-persona.git](https://github.com/enescelik00/flutter-application-software-persona.git)
    ```
2.  **Navigate to the project directory:**
    ```bash
    cd flutter-application-software-persona
    ```
3.  **Install dependencies:**
    ```bash
    flutter pub get
    ```
4.  **Run the app:**
    ```bash
    flutter run
    ```

---

### 👨‍💻 Author

**Enes Çelik**

* 💻 [GitHub Profile](https://github.com/enescelik00)
* 🔗 [LinkedIn Profile](https://www.linkedin.com/in/enescelik0)

---
