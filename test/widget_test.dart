import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_example/main.dart';

void main() {
  group("Unit tests for counter app", () {
    test('Initial value of the counter should be zero', () {
      final homePage = MyHomePage(title: 'Test App');
      expect(homePage.counter, 0);
    });

    // Unfortunately there aren't many unit tests that we can write for our given scenario
  });

  group("Widget tests for counter app", () {
    testWidgets('App renders and displays initial counter value',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      expect(find.text('0'), findsOneWidget);
    });

    testWidgets('Increment button increments the counter value',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();
      expect(find.text('1'), findsOneWidget);
    });

    testWidgets(
        'Counter should be reset to zero when the reset button is pressed',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      final incrementButton = find.byIcon(Icons.add);
      final resetButton = find.byKey(const Key("reset"));
      expect(find.text("0"), findsOneWidget);
      await tester.tap(incrementButton);
      await tester.pump();
      expect(find.text("1"), findsOneWidget);
      await tester.tap(resetButton);
      await tester.pump();
      expect(find.text("0"), findsOneWidget);
    });

    testWidgets('Counter increments smoke test', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const MyApp());

      // Verify that our counter starts at 0.
      expect(find.text('0'), findsOneWidget);
      expect(find.text('1'), findsNothing);

      // Tap the '+' icon and trigger a frame.
      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();

      // Verify that our counter has incremented.
      expect(find.text('0'), findsNothing);
      expect(find.text('1'), findsOneWidget);
    });
  });

  // This here could be an example of integration test
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);

    // Tap the reset button and trigger a frame.
    await tester.tap(find.widgetWithText(MaterialButton, "Reset"));
    await tester.pump();

    // Verify that our counter has reset.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);
  });
}
