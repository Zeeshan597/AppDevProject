import 'package:aitebar/core/services/firebase_service/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:aitebar/core/services/domain/auth_facade.dart';
import 'package:aitebar/mobile/features/auth/domain/models/user/user.dart';
import 'package:firebase_auth/firebase_auth.dart';



void main() {
  late AuthService authService;

  setUp(() {
    authService = AuthService();
  });
}
