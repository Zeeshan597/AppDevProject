import 'package:aitebar/web/features/auth/domain/auth_facade.dart';
import 'package:aitebar/web/features/auth/domain/models/admin/admin.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final IAdminAuthFacade _authService;

  AuthCubit(this._authService) : super(const AuthState.initial());

  Future<void> login(String email, String password) async {
    emit(const AuthState.loading());
    var res = await _authService.login(email, password);
    if(res is Admin) {
      emit(AuthState.success(res));
    } else {
      emit(AuthState.failure(res));
    }
  }
}
