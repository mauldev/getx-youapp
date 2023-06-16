import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:youapp_test/app/ui/pages/loginscreen_page/loginscreen_page.dart';
import 'package:youapp_test/app/ui/pages/registerscreen_page/registerscreen_page.dart';

void main() {
  group("Testing Register Page", () {
    testWidgets('RegisterscreenPage renders correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        GetMaterialApp(
          home: RegisterscreenPage(),
        ),
      );

      // Verify that the Register screen is rendered correctly
      expect(find.text('Register'), findsNWidgets(2));
      expect(find.text('Back'), findsOneWidget);
      expect(find.byType(TextFormField), findsNWidgets(4));
      expect(find.text('Have account?'), findsOneWidget);
      expect(find.text('Login here'), findsOneWidget);
    });

    testWidgets(
        'RegisterscreenPage navigates to LoginScreenPage on login text tap',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        GetMaterialApp(
          home: RegisterscreenPage(),
        ),
      );

      // Tap on the "Login here" text
      await tester.ensureVisible(find.byType(InkWell));
      await tester.pumpAndSettle();
      await tester.tap(find.byType(InkWell));
      await tester.pumpAndSettle();

      // Verify that the navigation to LoginScreenPage occurred
      expect(find.byType(LoginScreenPage), findsOneWidget);
    });
  });
}
