// This is a basic Flutter widget test for Power of God Through Words app.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:power_of_god_app/main.dart';

void main() {
  testWidgets('App loads with title and search bar', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const PowerOfGodApp());

    // Verify that the app title is displayed
    expect(find.text('Power of God Through Words'), findsOneWidget);

    // Verify that the search bar hint text is present
    expect(find.text('Search for a situation (e.g., fear, peace)...'), findsOneWidget);

    // Verify that situation tags are displayed
    expect(find.text('Fear'), findsOneWidget);
    expect(find.text('Faith'), findsOneWidget);
    expect(find.text('Peace'), findsOneWidget);
  });

  testWidgets('Search functionality works', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const PowerOfGodApp());

    // Initially all 8 situations should be visible
    expect(find.text('Fear'), findsOneWidget);
    expect(find.text('Wisdom'), findsOneWidget);

    // Find the search field and enter text
    await tester.enterText(
      find.byType(TextField),
      'fa',
    );
    await tester.pump();

    // After searching for 'fa', only 'Faith' should be visible
    expect(find.text('Faith'), findsOneWidget);
    expect(find.text('Fear'), findsNothing);
  });

  testWidgets('Tapping a situation navigates to verses screen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const PowerOfGodApp());

    // Find and tap the 'Fear' chip
    await tester.tap(find.text('Fear'));
    await tester.pumpAndSettle(); // Wait for navigation animation

    // Verify we're on the verses screen
    expect(find.text('Fear Verses'), findsOneWidget);
    expect(find.text('Bible verses for Fear'), findsOneWidget);

    // Verify that at least one verse reference is shown
    expect(find.textContaining('Isaiah'), findsWidgets);
  });

  testWidgets('Wrap widget displays situation chips', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const PowerOfGodApp());

    // Find the Wrap widget
    final wrapFinder = find.byType(Wrap);
    expect(wrapFinder, findsOneWidget);

    // Verify multiple situation chips are present (children of Wrap)
    expect(find.text('Fear'), findsOneWidget);
    expect(find.text('Faith'), findsOneWidget);
    expect(find.text('Peace'), findsOneWidget);
    expect(find.text('Joy'), findsOneWidget);
  });

  testWidgets('Flex widget structures the home screen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const PowerOfGodApp());

    // Find the Flex widget in home screen
    final flexFinder = find.byType(Flex);
    expect(flexFinder, findsWidgets);

    // Verify the search section and situations section are present
    expect(find.byType(TextField), findsOneWidget);
    expect(find.text('Choose Your Situation:'), findsOneWidget);
  });
}