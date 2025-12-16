import 'package:cure/core/helper/open_google_get_token.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cure/features/auth/domain/entities/user_entity.dart';
import 'package:cure/features/auth/domain/repo/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.authRepo}) : super(AuthInitial());

  final AuthRepo authRepo;

  Future<void> login({required String email, required String password}) async {
    emit(AuthLoading());
    var result = await authRepo.login(email: email, password: password);
    result.fold(
      (l) => emit(AuthError(message: l.message)),
      (r) => emit(AuthLoaded(user: r)),
    );
  }

  Future<void> register({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String gender,
    required String birthdate,
  }) async {
    emit(AuthLoading());
    var result = await authRepo.register(
      name: name,
      email: email,
      password: password,
      phone: phone,
      birthdate: birthdate,
      gender: gender,
    );
    result.fold(
      (l) => emit(AuthError(message: l.message)),
      (r) => emit(AuthLoaded(user: r)),
    );
  }

  Future<void> forgotPassword({required String email}) async {
    emit(AuthLoading());
    var result = await authRepo.forgotPassword(email: email);
    result.fold(
      (l) => emit(AuthError(message: l.message)),
      (r) => emit(AuthLoaded()),
    );
  }

  Future<void> verifyCode({required String email, required String code}) async {
    emit(AuthLoading());
    var result = await authRepo.verifyCode(email: email, code: code);
    result.fold(
      (l) => emit(AuthError(message: l.message)),
      (r) => emit(AuthLoaded()),
    );
  }

  Future<void> resetPassword({
    required String email,
    required String password,
    required String code,
  }) async {
    emit(AuthLoading());
    var result = await authRepo.resetPassword(
      email: email,
      code: code,
      password: password,
    );
    result.fold(
      (l) => emit(AuthError(message: l.message)),
      (r) => emit(AuthLoaded()),
    );
  }

  Future<void> loginWithPhone({required String phone}) async {
    emit(AuthLoading());
    var result = await authRepo.loginWithPhone(phone: phone);
    result.fold(
      (l) => emit(AuthError(message: l.message)),
      (r) => emit(AuthLoaded()),
    );
  }

  Future<void> verifyCodeWithPhone({
    required String phone,
    required String code,
  }) async {
    emit(AuthLoading());
    var result = await authRepo.verifyCodeWithPhone(phone: phone, code: code);
    result.fold(
      (l) => emit(AuthError(message: l.message)),
      (r) => emit(AuthLoaded(user: r)),
    );
  }

  Future<void> loginWithGoogle() async {
    emit(AuthLoading());

    final urlResult = await authRepo.getGoogleAuthUrl();

    urlResult.fold((l) => emit(AuthError(message: l.message)), (url) async {
      final resultToken = await openGoogleAndGetToken(url);

      if (resultToken == null) {
        emit(AuthError(message: 'Google login canceled'));
        return;
      }

      final loginResult = await authRepo.googleLogin(token: resultToken);

      loginResult.fold(
        (l) => emit(AuthError(message: l.message)),
        (user) => emit(AuthLoaded(user: user)),
      );
    });
  }
}
