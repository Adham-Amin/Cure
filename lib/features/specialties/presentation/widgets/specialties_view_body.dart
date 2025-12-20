import 'package:cure/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SpecialtiesViewBody extends StatelessWidget {
  const SpecialtiesViewBody({super.key, required this.specialties});

  final List<String> specialties;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Wrap(
        spacing: 16,
        children: specialties
            .map(
              (e) => GestureDetector(
                onTap: () =>
                    context.push(AppRoutes.doctorsBySpecialties, extra: e),
                child: Chip(
                  avatar: Icon(Icons.local_hospital_outlined),
                  label: Text(e),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
