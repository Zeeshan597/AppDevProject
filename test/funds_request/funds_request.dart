import 'package:aitebar/core/services/firebase_service/firebase_funds_request_service.dart';
import 'package:aitebar/mobile/features/create_funds_request/domain/models/request_fund/funds_request.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'funds_request.mocks.dart';

@GenerateMocks([FirebaseFundsRequestService])
Future<void> main() async {
  late FirebaseFundsRequestService service;

  setUp(() {
    service = MockFirebaseFundsRequestService();

    FundsRequest fundsRequest = const FundsRequest(id: 'id', uid: 'uid');
    when(service.getAllFundsRequests()).thenAnswer((_) => Future.value(List.empty()));
    when(service.createFundsRequest(fundsRequest: fundsRequest)).thenAnswer((_) => Future.value());
    when(service.updateFundsRequest(fundsRequest: fundsRequest)).thenAnswer((_) => Future.value());
  });

  group('Funds request', () {
    test('Get all funds requests', () async {
      final res = await service.getAllFundsRequests();
      expect(res, equals(List.empty()));
    });

    test('Create funds request', () async {
      FundsRequest fundsRequest = const FundsRequest(id: 'id', uid: 'uid');
      await service.createFundsRequest(fundsRequest: fundsRequest);

      verify(service.createFundsRequest(fundsRequest: fundsRequest)).called(1);
    });

    test('Update funds request', () async {
      FundsRequest fundsRequest = const FundsRequest(id: 'id', uid: 'uid');
      await service.updateFundsRequest(fundsRequest: fundsRequest);

      verify(service.updateFundsRequest(fundsRequest: fundsRequest)).called(1);
    });
  });
}
