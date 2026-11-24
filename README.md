# ☕ Coffee App

A coffee ordering mobile app built with **Flutter**. Browse the menu, choose how many cups you want, manage your cart, and confirm your order, all in a dark, coffee-themed UI.

![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-%E2%89%A53.4.3-0175C2?logo=dart&logoColor=white)
![State Management](https://img.shields.io/badge/State-Provider-8A4B2A)

<!--
SCREENSHOTS: add your images to a `screenshots/` folder, then uncomment this block.

## 📸 Screenshots

| Menu | Customize Order | Cart |
| :---: | :---: | :---: |
| <img src="screenshots/menu.png" width="220"/> | <img src="screenshots/customize.png" width="220"/> | <img src="screenshots/cart.png" width="220"/> |
-->

## ✨ Features

- **Coffee menu**: 7 drinks (Latte, Cappuccino, Espresso, Americano, Mocha, Iced Latte, Frappe), each with an image, description, and price.
- **Customize your order**: pick the number of cups with `+` / `-` buttons. The app asks you to add at least one cup before adding to the cart.
- **Shopping cart**: see every item with its cup count and price, and delete any item.
- **Edit an order**: tap an item in the cart to change its quantity; its price is recalculated automatically.
- **Live total**: the cart shows the total price of all items on the *Confirm order* button.
- **Order confirmation**: confirming shows a message and clears the cart.
- **Instant feedback**: short dialogs confirm each action (added, updated, confirmed, empty cart).
- **Bottom navigation** between *Home* and *Cart* using `google_nav_bar`.
- **Custom styling**: custom font (*Air Balloon*) and a consistent dark color palette.

## 🛠️ Tech Stack

| Area | Technology |
| --- | --- |
| Framework | Flutter |
| Language | Dart (SDK `>=3.4.3 <4.0.0`) |
| State management | [`provider`](https://pub.dev/packages/provider) (`ChangeNotifier`) |
| Navigation bar | [`google_nav_bar`](https://pub.dev/packages/google_nav_bar) |
| Icons | Material Icons, `cupertino_icons` |
| Linting | `flutter_lints` |

## 🗂️ Project Structure

```
lib/
├── main.dart                  # App entry point, Provider setup
├── constants.dart             # Colors, font name, image paths
├── models/
│   ├── coffee_model.dart      # Coffee (name, price, image, description)
│   ├── order_model.dart       # Order (selected coffee, cups, price)
│   └── coffee_shop.dart       # ChangeNotifier: menu, cart, cups counter
└── view/
    ├── screens/
    │   ├── home_page.dart             # Scaffold + bottom navigation
    │   ├── shop_page.dart             # Menu list
    │   ├── customize_order_page.dart  # Choose cups / update order
    │   ├── cart_page.dart             # Cart + confirm order
    │   └── spalsh_screen.dart         # Splash screen with the logo
    └── widgets/
        ├── coffe_tile.dart            # Menu item card
        ├── cart_tile.dart             # Cart item card
        └── custom_nav_bar.dart        # Bottom nav bar (GNav)
assets/
├── fonts/                     # Air Balloon font
└── images/                    # Coffee images and logo
```

## 🏗️ How It Works

State is managed with **Provider**. A single `CoffeeShop` class (a `ChangeNotifier`) holds:

- `products`: the list of available coffees
- `userCart`: the list of `Order` objects the user added
- `cups`: the current cup counter on the customize screen

Screens listen to `CoffeeShop` through `Consumer` and rebuild whenever the cart or counter changes (`addItem`, `removeItem`, `clearCart`, `moreCups`, `lessCups`).

## 🚀 Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (Dart `>=3.4.3`)
- Android Studio or VS Code with the Flutter extension
- An emulator or a physical device

### Run the app

```bash
# 1. Clone the repository
git clone https://github.com/ahmd4real/coffee_app.git

# 2. Go to the project folder
cd coffee_app

# 3. Install dependencies
flutter pub get

# 4. Run
flutter run
```

### Build an APK

```bash
flutter build apk --release
```

## 🔮 Possible Improvements

- Save the cart locally so it survives app restarts
- Connect to a backend or Firebase for real orders
- Add coffee sizes and extras (milk type, sugar, toppings)
- Show the splash screen on app launch
- Add unit and widget tests

## 👤 Author

**Ahmed Alaa**: Flutter Developer

- GitHub: [@ahmd4real](https://github.com/ahmd4real)
