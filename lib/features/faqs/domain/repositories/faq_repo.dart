import 'package:cure/core/errors/failure.dart';
import 'package:cure/features/faqs/domain/entities/faq_entity.dart';
import 'package:dartz/dartz.dart';

abstract class FaqRepo {
  Future<Either<Failure, List<FaqEntity>>> getFaqs();
}
