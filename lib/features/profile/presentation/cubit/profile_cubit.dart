import 'package:cure/features/auth/domain/entities/user_entity.dart';
import 'package:cure/features/profile/data/models/edit_profile_request.dart';
import 'package:cure/features/profile/domain/repositories/profile_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit({required this.profileRepo}) : super(ProfileInitial());

  final ProfileRepo profileRepo;

  Future<void> updateProfile({required EditProfileRequest data}) async {
    emit(ProfileLoading());
    final result = await profileRepo.editProfile(data: data);
    result.fold(
      (l) => emit(ProfileError(message: l.message)),
      (r) => emit(ProfileLoaded(user: r)),
    );
  }

  Future<void> deleteAccount() async {
    emit(ProfileLoading());
    final result = await profileRepo.deleteAccount();
    result.fold(
      (l) => emit(ProfileError(message: l.message)),
      (r) => emit(ProfileDeleted()),
    );
  }
}
