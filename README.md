# Calculator App

A Flutter-based calculator app built as part of a company assignment. The UI is inspired by the iOS calculator with some custom touches like live expression preview, calculation history, and theme switching.

---

## Setup

Make sure you have Flutter installed and a device/emulator ready.

```bash
git clone https://github.com/ishaparmar000/calculator_app.git
cd calculator_app
flutter pub get
flutter run
```

Tested on Flutter SDK `3.9.0`. Should work fine on both Android and iOS.

---

## What's in the app

- Basic arithmetic — addition, subtraction, multiplication, division
- Square root
- As you type the second number, you can already see the result in a smaller text below the expression
- Numbers get thousand-separator commas while typing (e.g. `1,403,640`)
- Every completed calculation gets saved to a local SQLite database
- History screen to view and clear past calculations
- Dark and light theme with the preference saved locally
- Button press animation so it feels a bit more alive

---

## Folder structure

```
lib/
├── controllers/
│   └── display_controller.dart
├── db/
│   └── db_helper.dart
├── models/
│   └── calculation_history_model.dart
├── screens/
│   ├── display_screen.dart
│   └── history_screen.dart
├── utils/
│   ├── app_colors.dart
│   └── style_helper.dart
└── main.dart
```

I tried to keep things simple and separated. The screen files only deal with UI, all the logic lives in the controller, and the database stuff is handled in its own helper class.

---

## Architecture

Nothing too fancy here. The app follows a straightforward Controller–View pattern.

The `DisplayScreen` widget just renders the UI and calls methods on `DisplayController` when buttons are tapped. It doesn't hold any state of its own. All the calculation logic, expression building, and database calls happen inside the controller.

`DBHelper` is a plain class that wraps the sqflite calls — insert, fetch all, and delete. The controller holds an instance of it directly since there's no need for a full repository layer in an app this size.

---

## State Management

I used **GetX** for state management.

I picked GetX mainly because it keeps things minimal. There's no boilerplate — you just add `.obs` to a variable and wrap the widget in `Obx()` and it reacts automatically. It also handles navigation and dependency injection in the same package which meant I didn't need to pull in extra stuff.

The reactive variables in the controller:

```dart
RxString displayValue    = '0'.obs;
RxString expression      = ''.obs;
RxString previewResult   = ''.obs;
RxDouble firstOperand    = 0.0.obs;
RxString currentOperator = ''.obs;
RxBool   shouldReset     = false.obs;
```

The display has two text areas — a large one for the current expression and a smaller dimmed one below for the live preview. Both are wrapped in `Obx()` so they only rebuild when their specific value changes.

When `=` is pressed:
- The full equation (e.g. `91 × 91 =`) moves to the smaller preview line
- The result (`8,281`) takes over as the large display text
- The record gets inserted into SQLite

---

## Database

Using `sqflite` for local storage. Single table:

| Column | Type | Notes |
|---|---|---|
| id | INTEGER | Primary key, auto increment |
| expression | TEXT | e.g. `91 × 91` |
| result | TEXT | e.g. `8,281` |
| created_at | TEXT | DateTime stored as string |

Saves on `=` press and after a `√` calculation. Nothing gets saved for intermediate steps.

---

## Packages used

| Package | What I used it for |
|---|---|
| get | State management, navigation, theme |
| flutter_screenutil | Responsive sizes across different screen densities |
| sqflite | Local database for history |
| get_storage | Saving the theme preference |
| intl | Date formatting on the history screen |
| flutter_animate | Button and screen animations |
| flutter_staggered_animations | Staggered list animation on history screen |
| fluttertoast | Small feedback toasts |

---

## Fonts

SF Pro font family is bundled locally under `assets/fonts/` — Regular, Medium, SemiBold, and Bold weights. Helps match the iOS calculator feel.
