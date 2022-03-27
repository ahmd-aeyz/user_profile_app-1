import 'package:final_project/core/presentation/theme/colors.dart';
import 'package:final_project/features/profile/presentation/widgets/profile_image_widget.dart';
import 'package:flutter/material.dart';

class EditProfileImageWidget extends StatelessWidget {
  const EditProfileImageWidget({
    required this.imageUrl,
    required this.onPressed,
  });
  final String imageUrl;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ProfileImageWidget(imageUrl),
        Positioned(
          right: 0,
          bottom: 8,
          child: IconButton(
            onPressed: onPressed,
            icon: const Icon(
              Icons.camera_alt,
              color: primaryColor,
              size: 24,
            ),
          ),
        ),
      ],
    );
  }
}
