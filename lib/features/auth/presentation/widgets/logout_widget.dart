import 'package:flutter/material.dart';

class LogoutWidget extends StatelessWidget {
  const LogoutWidget({required this.onPressed});
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontSize: 16,
      color: Color(0xff3282B8),
      fontWeight: FontWeight.bold,
    );
    return Padding(
      padding: const EdgeInsets.only(
        right: 12,
      ),
      child: InkWell(
        onTap: () {
          final dialog = AlertDialog(
            title: const Text('Are you sure you want to logout?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text(
                  'NO',
                  style: textStyle,
                ),
              ),
              TextButton(
                onPressed: onPressed,
                child: const Text(
                  'YES',
                  style: textStyle,
                ),
              ),
            ],
          );
          showDialog(
            context: context,
            builder: (_) => dialog,
          );
        },
        child: const CircleAvatar(
          radius: 18,
          backgroundColor: Color.fromARGB(255, 212, 5, 5),
          child: Icon(
            Icons.logout,
            size: 25,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
