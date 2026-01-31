import 'package:cure/features/auth/data/models/requests/register_request.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cure/features/auth/domain/entities/user_entity.dart';
import 'package:cure/features/auth/domain/repo/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.authRepo}) : super(AuthInitial());

  final AuthRepo authRepo;

  Future<void> login({required String phone, required String password}) async {
    emit(AuthLoading());
    var result = await authRepo.login(phone: phone, password: password);
    result.fold(
      (l) => emit(AuthError(message: l.message)),
      (r) => emit(AuthLoaded(user: r)),
    );
  }

  Future<void> register({required RegisterRequest registerRequest}) async {
    emit(AuthLoading());
    var result = await authRepo.register(registerRequest: registerRequest);
    result.fold(
      (l) => emit(AuthError(message: l.message)),
      (r) => emit(AuthLoaded()),
    );
  }

  Future<void> forgotPassword({required String phone}) async {
    emit(AuthLoading());
    var result = await authRepo.forgotPassword(phone: phone);
    result.fold(
      (l) => emit(AuthError(message: l.message)),
      (r) => emit(AuthLoaded()),
    );
  }

  Future<void> verifyCode({required String phone, required String code}) async {
    emit(AuthLoading());
    var result = await authRepo.verifyCode(phone: phone, code: code);
    result.fold(
      (l) => emit(AuthError(message: l.message)),
      (r) => emit(AuthLoaded()),
    );
  }

  Future<void> resetPassword({
    required String phone,
    required String password,
    required String confirmPassword,
  }) async {
    emit(AuthLoading());
    var result = await authRepo.resetPassword(
      phone: phone,
      confirmPassword: confirmPassword,
      password: password,
    );
    result.fold(
      (l) => emit(AuthError(message: l.message)),
      (r) => emit(AuthLoaded()),
    );
  }
}
