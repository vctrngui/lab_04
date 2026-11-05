// Lab Exercise 4.1: three widget tests for the Pizza Store app
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lab_04/main.dart';

void main() {
  testWidgets('menu lists the three items', (WidgetTester tester) async {
    await tester.pumpWidget(const Lab04());

    expect(find.text('Vegetable Pizza'), findsOneWidget);
    expect(find.text('Cheese Pizza'), findsOneWidget);
    expect(find.text('Box of Fries'), findsOneWidget);
  });

  testWidgets('tapping a card opens its detail screen',
      (WidgetTester tester) async {
    await tester.pumpWidget(const Lab04());

    await tester.tap(find.text('Vegetable Pizza'));
    await tester.pumpAndSettle();

    // Detail screen is showing: its description is visible, the menu title is not.
    expect(
      find.text('Vegetable Pizza is a pizza with mixed '
          'vegetable mix on top of it.'),
      findsOneWidget,
    );
    expect(find.text('Android ATC Pizza Place'), findsNothing);
  });

  testWidgets('back button returns to the menu', (WidgetTester tester) async {
    await tester.pumpWidget(const Lab04());

    await tester.tap(find.text('Cheese Pizza'));
    await tester.pumpAndSettle();
    expect(find.byType(BackButton), findsOneWidget);

    await tester.tap(find.byType(BackButton));
    await tester.pumpAndSettle();

    expect(find.text('Android ATC Pizza Place'), findsOneWidget);
    expect(find.text('Box of Fries'), findsOneWidget);
  });
}
