// Vibe Coding Task 4: verify the Order Summary screen
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lab_04/order.dart';
import 'package:lab_04/order_summary.dart';

void main() {
  testWidgets('shows item name, quantity and correct total (RM 25.00)',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: OrderSummaryScreen()),
    );

    expect(find.text('Item: Vegetable Pizza'), findsOneWidget);
    expect(find.text('Quantity: 2'), findsOneWidget);
    expect(find.text('Total: RM 25.00'), findsOneWidget);
  });

  testWidgets('Back button pops the screen', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) => Scaffold(
            body: ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => const OrderSummaryScreen()),
              ),
              child: const Text('Open'),
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.text('Open'));
    await tester.pumpAndSettle();
    expect(find.text('Order Summary'), findsOneWidget);

    await tester.tap(find.text('Back'));
    await tester.pumpAndSettle();
    expect(find.text('Order Summary'), findsNothing);
    expect(find.text('Open'), findsOneWidget);
  });

  test('orderTotal multiplies price by quantity', () {
    expect(orderTotal(unitPrice: 12.50, quantity: 2), 25.00);
  });

  test('orderTotal rejects negative quantity', () {
    expect(() => orderTotal(unitPrice: 12.50, quantity: -1),
        throwsArgumentError);
  });
}
