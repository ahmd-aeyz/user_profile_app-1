import 'package:flutter/material.dart';

class ProfileImageWidget extends StatelessWidget {
  const ProfileImageWidget(this.imageUrl);
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 16,
      ),
      child: CircleAvatar(
        backgroundImage: NetworkImage(
          imageUrl,
        ),
        radius: 50,
      ),
    );
  }
}
