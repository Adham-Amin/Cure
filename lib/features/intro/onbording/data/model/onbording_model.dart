import 'package:cure/core/utils/app_assets.dart';

class OnbordingModel {
  final String image;
  final String title;
  final String description;

  OnbordingModel({
    required this.image,
    required this.title,
    required this.description,
  });

  static List<OnbordingModel> onbordingList = [
    OnbordingModel(
      image: AppAssets.imagesOnOne,
      title: 'Book Your Appointment Easily',
      description:
          'Choose your preferred doctor, pick a suitable time, and confirm your visit in just a few taps. No calls, no waiting—just simple and fast booking.',
    ),
    OnbordingModel(
      image: AppAssets.imagesOnTwo,
      title: 'Find Doctors Around You',
      description:
          'Quickly discover trusted doctors near your area. Whether you need a general checkup or a specialist, we connect you with nearby clinics for fast and convenient care.',
    ),
  ];
}
