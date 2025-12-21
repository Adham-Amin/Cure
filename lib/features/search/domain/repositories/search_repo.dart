import 'package:cure/core/errors/failure.dart';
import 'package:cure/features/home/domain/entities/doctor_entity.dart';
import 'package:cure/features/search/domain/entities/search_history_entity.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<DoctorEntity>>> getSearchData({
    required String query,
  });
  Future<Either<Failure, List<SearchHistoryEntity>>> getSearchHistory();
  Future<Either<Failure, void>> clearSearchHistory();
  Future<Either<Failure, void>> deleteSpecificSearch({required String id});
}
