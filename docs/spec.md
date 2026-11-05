# Order Summary Screen: Mini-Spec

- **Inputs:** Item name (`Vegetable Pizza`), unit price (RM 12.50) and quantity (2), all hard-coded constants.
- **Output:** A screen titled "Order Summary" showing the item name, the quantity and the total price in RM (2 decimal places).
- **Rules:** The total must come from `orderTotal()` in `lib/order.dart`; the screen is a `StatelessWidget` in `lib/order_summary.dart`.
- **Out of scope:** Editing the quantity, payment, a cart, saving orders, and any changes to other files.
- **Check:** `flutter analyze` shows no issues and the widget test shows "Total: RM 25.00" for 2 x RM 12.50.
- **Navigation:** A Back button calls `Navigator.pop(context)` to return to the previous screen.
