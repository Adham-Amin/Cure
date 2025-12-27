import 'package:cure/core/services/api_service.dart';
import 'package:cure/features/faqs/data/models/faq_model/faq_model.dart';

abstract class FaqRemoteDataSource {
  Future<FaqModel> getFaqs();
}

class FaqRemoteDataSourceImpl implements FaqRemoteDataSource {
  final ApiService apiService;
  FaqRemoteDataSourceImpl({required this.apiService});
  @override
  Future<FaqModel> getFaqs() async {
    final response = await apiService.get(endPoint: '/faqs');
    return FaqModel.fromJson(response);
  }
}
