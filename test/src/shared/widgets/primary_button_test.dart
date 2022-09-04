import 'package:dummy_json/src/shared/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("Primary Button properties test", (tester) async {
    const ColorScheme colorScheme = ColorScheme.light();
    final ThemeData theme = ThemeData.from(colorScheme: colorScheme);
    const primaryButton = PrimaryButton(
      buttonText: "Test",
      isExpanded: false,
    );
    await tester.pumpWidget(
      MaterialApp(
        theme: theme,
        home: const Center(
          child: primaryButton,
        ),
      ),
    );

    expect(find.byType(PrimaryButton), findsOneWidget);
    expect(find.text("Test", findRichText: true), findsOneWidget);
    expect(primaryButton.isExpanded, false);
    expect(primaryButton.buttonText, "Test");
    expect(primaryButton.onPressed, null);
  });

  testWidgets(
      'Primary Button onPressed callback are correctly called when non-null',
      (WidgetTester tester) async {
    bool wasPressed;
    Finder primaryButton;

    Widget buildFrame({VoidCallback? onPressed}) {
      return Directionality(
        textDirection: TextDirection.ltr,
        child: PrimaryButton(
          onPressed: onPressed,
          buttonText: 'button',
        ),
      );
    }

    // onPressed not null.
    wasPressed = false;
    await tester.pumpWidget(
      buildFrame(onPressed: () {
        wasPressed = true;
      }),
    );
    primaryButton = find.byType(PrimaryButton);
    await tester.tap(primaryButton);
    expect(wasPressed, true);
  });
}
