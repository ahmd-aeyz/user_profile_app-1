import 'package:final_project/core/theme/colors.dart';
import 'package:flutter/material.dart';

class ProfileItemWidget extends StatelessWidget {
  final String text;
  final IconData icon;
  const ProfileItemWidget({
    required this.text,
    required this.icon,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        right: 22,
        left: 22,
        top: 16,
      ),
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 28,
            color: primaryColor,
          ),
          const SizedBox(width: 16),
          Text(
            text,
            style: Theme.of(context).textTheme.headline6,
          ),
          const Spacer(),
          const Icon(
            Icons.arrow_forward_ios_rounded,
            size: 27,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
