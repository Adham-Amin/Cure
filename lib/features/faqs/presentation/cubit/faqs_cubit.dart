import 'package:cure/features/faqs/domain/entities/faq_entity.dart';
import 'package:cure/features/faqs/domain/repositories/faq_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'faqs_state.dart';

class FaqsCubit extends Cubit<FaqsState> {
  FaqsCubit({required this.faqRepo}) : super(FaqsInitial());

  final FaqRepo faqRepo;

  Future<void> getFaqs() async {
    emit(FaqsLoading());
    final faqs = await faqRepo.getFaqs();
    faqs.fold(
      (l) => emit(FaqsError(message: l.message)),
      (r) => emit(FaqsLoaded(faqs: r)),
    );
  }
}
