import 'package:cure/features/update_number/domain/repositories/update_number_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'update_number_state.dart';

class UpdateNumberCubit extends Cubit<UpdateNumberState> {
  UpdateNumberCubit({required this.updateNumberRepo})
    : super(UpdateNumberInitial());

  final UpdateNumberRepo updateNumberRepo;

  Future<void> updateNumber({required String number}) async {
    emit(UpdateNumberLoading());
    final result = await updateNumberRepo.updateNumber(number: number);
    result.fold(
      (l) => emit(UpdateNumberError(message: l.message)),
      (r) => emit(UpdateNumberLoaded()),
    );
  }

  Future<void> verifyCode({
    required String code,
    required String newNumber,
  }) async {
    emit(UpdateNumberLoading());
    final result = await updateNumberRepo.verifyCode(
      code: code,
      newNumber: newNumber,
    );
    result.fold(
      (l) => emit(UpdateNumberError(message: l.message)),
      (r) => emit(UpdateNumberLoaded()),
    );
  }
}
