import 'dart:io';
import 'package:cure/core/services/shared_preferences_service.dart';
import 'package:cure/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileImagePicker extends StatelessWidget {
  final File? file;
  final Function(File?) onPick;

  const ProfileImagePicker({
    super.key,
    required this.file,
    required this.onPick,
  });

  Future<void> _pick(BuildContext context) async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (picked != null) {
      onPick(File(picked.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () => _pick(context),
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.grey.shade200,
              backgroundImage: file != null
                  ? FileImage(file!)
                  : Prefs.getUser()!.imageUrl == null
                  ? null
                  : Image.network(Prefs.getUser()!.imageUrl!).image,
              child: Prefs.getUser()!.imageUrl == null
                  ? Icon(Icons.person, size: 60, color: Colors.grey)
                  : null,
            ),
            CircleAvatar(
              radius: 15,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.camera_alt_rounded,
                size: 20,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
