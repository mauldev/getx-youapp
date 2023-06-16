import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';
import 'package:youapp_test/app/mock/mock_login_api.dart';
import 'package:youapp_test/app/ui/pages/loginscreen_page/loginscreen_page.dart';
import 'package:youapp_test/app/ui/pages/registerscreen_page/registerscreen_page.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';

import 'loginscreen_page_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late ApiProvider apiProvider;
  late http.Client client;
  setUp(() {
    client = MockClient();
    apiProvider = ApiProvider(client: client);
  });

  group("Testing LoginPage", () {
    testWidgets('http call is working', (tester) async {
      String email = 'sampleemail@example.com';
      String password = '123';
      when(client.get(Uri.parse(
              'http://techtest.youapp.ai/api/login?email=$email&password=$password')))
          .thenAnswer((_) async => http.Response('{"message": "succes"}', 200));

      final response =
          await apiProvider.fetchLogin("sampleemail@example.com", "123");
      expect(response, isA<Login>());
      expect(response.message, "succes");
    });
    testWidgets('LoginScreenPage should render correctly',
        (WidgetTester tester) async {
      // Build the LoginScreenPage widget
      await tester.pumpWidget(
        const MaterialApp(
          home: LoginScreenPage(),
        ),
      );

      // Verify that the page renders correctly
      expect(find.text('Login'), findsNWidgets(2));
      expect(find.byType(InputEmail_Tab), findsOneWidget);
      expect(find.byType(InputPassword_Tab), findsOneWidget);
      expect(find.byType(ButtonLogin_Tab), findsOneWidget);
      expect(find.byType(RegisterText_Tab), findsOneWidget);
    });

    testWidgets('Tapping register text should navigate to Register screen',
        (WidgetTester tester) async {
      // Build the LoginScreenPage widget
      await tester.pumpWidget(
        const GetMaterialApp(
          home: LoginScreenPage(),
        ),
      );

      // Tap the register text
      await tester.tap(find.byType(InkWell));
      await tester.pumpAndSettle();

      // Verify that the Register screen is navigated to
      expect(find.byType(RegisterscreenPage),
          findsOneWidget); // Replace with your Register screen widget
    });
  });
}
