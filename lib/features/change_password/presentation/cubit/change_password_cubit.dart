import 'package:cure/features/change_password/domain/repositories/change_password_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit({required this.changePasswordRepo})
    : super(ChangePasswordInitial());

  final ChangePasswordRepo changePasswordRepo;

  Future<void> changePassword({
    required String oldPassword,
    required String newPassword,
    required String newConfirmPassword,
  }) async {
    emit(ChangePasswordLoading());
    final result = await changePasswordRepo.changePassword(
      oldPassword: oldPassword,
      newPassword: newPassword,
      newConfirmPassword: newConfirmPassword,
    );
    result.fold(
      (l) => emit(ChangePasswordError(message: l.message)),
      (r) => emit(ChangePasswordLoaded()),
    );
  }
}
