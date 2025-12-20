import 'package:cure/features/specialties/presentation/widgets/specialties_view_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SpecialtiesView extends StatelessWidget {
  const SpecialtiesView({super.key, required this.specialties});

  final List<String> specialties;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => context.pop(),
        ),
        title: const Text('Specialties'),
      ),
      body: SpecialtiesViewBody(specialties: specialties),
    );
  }
}
