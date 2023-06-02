import 'package:aitebar/core/services/firebase_service/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_service.mocks.dart';

@GenerateMocks([AuthService])
void main() {

  late AuthService authService;
  const email = 'test@example.com';
  const password = 'password';
  const invalidEmail = 'invalid-email';
  const invalidPassword = 'invalid-password';

  setUp(() {
    authService = MockAuthService();
    // sign up user
    when(authService.signUp(email: email, password: password)).thenAnswer((_) => Future.value(UserCredential));
    when(authService.signUp(email: invalidEmail, password: invalidPassword)).thenAnswer((_) => Future.value(Exception));
    // login user
    when(authService.login(email: email, password: password)).thenAnswer((_) => Future.value(UserCredential));
    when(authService.login(email: invalidEmail, password: invalidPassword)).thenAnswer((_) => Future.value(Exception));
  });

  group('Sign up cases', () {
    // sign up user

    test('Sign up - valid case', () async {
      final res = await authService.signUp(email: email, password: password);
      expect(res, equals(UserCredential));
    });

    test('Sign up - invalid case', () async {
      final res = await authService.signUp(email: invalidEmail, password: invalidPassword);
      expect(res, equals(Exception));
    });

    // login user
    test('Login - valid case', () async {
      final res = await authService.login(email: email, password: password);
      expect(res, equals(UserCredential));
    });

    test('Login - invalid case', () async {
      final res = await authService.login(email: invalidEmail, password: invalidPassword);
      expect(res, equals(Exception));
    });
  });
}
