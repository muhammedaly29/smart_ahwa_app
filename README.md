# Smart Ahwa Manager - Flutter App

## Overview

This repository implements the **Smart Ahwa Manager**, a Flutter application developed as the solution for **Question 6** of the "OOP and SOLID Principles in Dart/Flutter Week 1 Multiple-Choice Assessment". The assessment focuses on applying Object-Oriented Programming (OOP) and SOLID principles to Dart/Flutter code, with an emphasis on modularity, object modeling, and abstraction as described in *The Object-Oriented Thought Process*. 

Question 6 presents a user story for a simple Flutter app to manage an Egyptian "ahwa" (traditional coffee shop): allowing the addition of orders with customer names, drink types (e.g., Shai, Turkish Coffee, Hibiscus Tea), special instructions (e.g., "extra mint"), marking orders as completed, displaying pending orders in a dashboard, and generating reports for top-selling drinks and total orders served. The implementation must incorporate at least three SOLID principles and OOP concepts like inheritance, polymorphism, and encapsulation.

The app streamlines ahwa operations by providing an intuitive UI for order tracking and analytics, demonstrating how principled design enhances maintainability and scalability in real-world Flutter applications.

## Features

- **Order Addition:** Form-based input for customer name, drink selection via dropdown, and optional instructions.
- **Order Completion:** Tap a check icon to mark pending orders as completed.
- **Pending Orders Dashboard:** Real-time list view of unfinished orders with customer and drink details.
- **Report Generation:** Button-triggered report showing top-selling drinks (e.g., frequency count) and total served orders, displayed in a custom dialog.
- **Extensibility:** Easy to add new drink types or extend reporting without modifying core logic.

## Technologies Used

- **Flutter:** Cross-platform UI framework for the dashboard and widgets.
- **Dart:** Language for business logic, models, and services.
- **SOLID Principles:** SRP, OCP, DIP (detailed below).
- **OOP Concepts:** Encapsulation, inheritance, polymorphism, abstraction.
- **State Management:** Basic `setState` for simplicity; extensible to Provider or Riverpod.

## Setup Instructions

1. **Clone the Repository:**
   ```
   git clone https://github.com/muhammedaly29/smart-ahwa-manager-flutter.git
   cd smart-ahwa-manager-flutter
   ```

2. **Install Dependencies:**
   ```
   flutter pub get
   ```

3. **Add Assets (if needed):**
   - Place the logo image in `assets/` and update `pubspec.yaml`:
     ```
     flutter:
       assets:
         - assets/logo.png
     ```

4. **Run the App:**
   ```
   flutter run
   ```
   - Test on an emulator or physical device to interact with the dashboard.

## Implementation Details

### What I Did for Question 6

To address the user story, I designed a modular Flutter app with a clean architecture separating concerns into models, services, repositories, and UI components. The core logic revolves around an `OrderManager` for handling CRUD operations on orders, a `ReportGenerator` for analytics, and an `AhwaDashboard` widget for the user interface. I used an in-memory repository for persistence (easily swappable for Firestore or SQLite).

- **User Story Fulfillment:**
  - **Adding Orders:** A form with `CustomTextField` for name/instructions and `DrinkDropdown` for selection, validated before adding via `OrderManager.addOrder()`.
  - **Marking Completed:** `PendingOrdersListView` displays orders with an `IconButton` calling `OrderManager.completeOrder()`.
  - **Dashboard:** `SingleChildScrollView` with `ListView.builder` for dynamic pending orders.
  - **Reports:** `CustomButton` triggers `ReportGenerator` to compute top drinks (using a `Map` for counts) and total served, shown in `ReportDialog`.

The design ensures the app is robust for daily ahwa use: quick order entry, visual tracking, and insights for inventory (e.g., popular drinks like Shai).

### Applied OOP Principles
- **Encapsulation:** In `Order`, private fields (`_customerName`, `_drink`, `_isCompleted`) with public getters prevent invalid states, aligning with data integrity in *The Object-Oriented Thought Process*.
- **Inheritance:** `Drink` abstract class with subclasses (`Shai`, `TurkishCoffee`, `HibiscusTea`) models real-world variations, supporting object modeling.
- **Polymorphism:** `DrinkDropdown` uses a list of `Drink` instances, allowing runtime selection of subclasses.
- **Abstraction:** Interfaces like `IOrderRepository` and abstract `Drink` hide implementation details, promoting modularity.

### Applied SOLID Principles (At Least Three)
- **Single Responsibility Principle (SRP):** Each class has one job—e.g., `Order` encapsulates data, `OrderManager` manages operations, `ReportGenerator` handles analytics—reducing complexity and improving reusability, as per the book's emphasis on focused objects.
- **Open-Closed Principle (OCP):** The `Drink` hierarchy allows adding new types (e.g., `MangoJuice`) by subclassing without changing existing code (e.g., dropdown or reports), directly linking to Question 1's extensibility fix.
- **Dependency Inversion Principle (DIP):** `OrderManager` depends on `IOrderRepository` abstraction (injected via constructor), enabling swaps like `InMemoryOrderRepository` to a database without altering the manager, enhancing testability and decoupling.
- **Bonus (Interface Segregation - ISP):** `IOrderRepository` and `IReportGenerator` are minimal, avoiding bloated interfaces.
- **Bonus (Liskov Substitution - LSP):** Subclasses like `Shai` behave identically to `Drink` expectations.

These principles matter because they make the app scalable for business growth (e.g., adding features without refactoring), demonstrating critical thinking on design flaws and fixes as required in the assessment.

### Project Structure
smart-ahwa-manager-flutter/
├── assets/                   # Static assets (e.g., logo.png)
├── lib/
│   ├── main.dart             # App entry point
│   ├── models/               # Data models
│   │   ├── drink.dart        # Abstract Drink and subclasses
│   │   └── order.dart        # Order model with encapsulation
│   ├── repositories/         # Data access layer
│   │   ├── i_order_repository.dart # Repository interface
│   │   └── in_memory_order_repository.dart # In-memory implementation
│   ├── services/             # Business logic
│   │   ├── order_manager.dart # Order management with DIP
│   │   └── report_generator.dart # Reporting with SRP and OCP
│   └── screens/              # UI components
│       └── ahwa_dashboard.dart # Main dashboard widget
├── gifs/                     # Animated demonstrations 
├── pubspec.yaml              # Flutter configuration and dependencies
└── README.md                 # This file

### GIFs
![Add Order GIF](gif/gif.gif)  
*Demonstration of adding an order (e.g., "Ahmed - Shai with extra mint") and updating the pending list.*


*Last Updated: September 17, 2025*
