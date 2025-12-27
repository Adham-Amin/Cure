import 'package:cure/core/errors/failure.dart';
import 'package:cure/features/faqs/data/datasources/faq_remote_data_source.dart';
import 'package:cure/features/faqs/domain/entities/faq_entity.dart';
import 'package:cure/features/faqs/domain/repositories/faq_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class FaqRepoImpl implements FaqRepo {
  final FaqRemoteDataSource faqRemoteDataSource;
  FaqRepoImpl({required this.faqRemoteDataSource});
  @override
  Future<Either<Failure, List<FaqEntity>>> getFaqs() async {
    try {
      final faqs = await faqRemoteDataSource.getFaqs();
      return Right(faqs.toEntity());
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
