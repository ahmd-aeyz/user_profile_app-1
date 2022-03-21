import 'package:final_project/core/di/injectable.dart';
import 'package:final_project/core/router/app_router.dart';
import 'package:final_project/core/theme/my_theme.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: myTheme,
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
