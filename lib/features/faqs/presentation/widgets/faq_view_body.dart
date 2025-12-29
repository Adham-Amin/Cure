import 'package:cure/core/functions/extentions.dart';
import 'package:cure/core/utils/app_colors.dart';
import 'package:cure/features/faqs/presentation/cubit/faqs_cubit.dart';
import 'package:cure/features/faqs/presentation/widgets/faq_item.dart';
import 'package:cure/features/faqs/presentation/widgets/loading_faq.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FaqViewBody extends StatefulWidget {
  const FaqViewBody({super.key});

  @override
  State<FaqViewBody> createState() => _FaqViewBodyState();
}

class _FaqViewBodyState extends State<FaqViewBody> {
  final List<bool> _isExpanded = List.generate(4, (_) => false);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FaqsCubit, FaqsState>(
      builder: (context, state) {
        if (state is FaqsLoading) {
          return LoadingFaq();
        } else if (state is FaqsLoaded) {
          return Padding(
            padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
            child: ListView.separated(
              itemCount: state.faqs.length,
              physics: const BouncingScrollPhysics(),
              separatorBuilder: (context, index) => 16.hs,
              itemBuilder: (context, index) => Container(
                decoration: BoxDecoration(
                  color: AppColors.lightCard,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: FaqItem(
                  question: state.faqs[index].question,
                  answer: state.faqs[index].answer,
                  isExpanded: _isExpanded[index],
                  onExpansionChanged: (value) {
                    setState(() {
                      _isExpanded[index] = value;
                    });
                  },
                ),
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}
