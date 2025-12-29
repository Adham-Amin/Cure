import 'package:cure/core/di/service_locator.dart';
import 'package:cure/features/faqs/domain/repositories/faq_repo.dart';
import 'package:cure/features/faqs/presentation/cubit/faqs_cubit.dart';
import 'package:cure/features/faqs/presentation/widgets/faq_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FaqView extends StatelessWidget {
  const FaqView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FaqsCubit(faqRepo: getIt<FaqRepo>())..getFaqs(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () => context.pop(),
          ),
          title: const Text('FAQs'),
        ),
        body: const FaqViewBody(),
      ),
    );
  }
}
