import 'package:final_project/core/domain/di/injectable.dart';
import 'package:final_project/core/presentation/bloc/bloc_observer.dart';
import 'package:final_project/core/presentation/router/app_router.dart';
import 'package:final_project/core/presentation/theme/my_theme.dart';
import 'package:final_project/features/auth/presentation/bloc/auth_cubit.dart';
import 'package:final_project/features/profile/presentation/bloc/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  BlocOverrides.runZoned(
    () {
      GetIt.I<AuthCubit>();
      GetIt.I<ProfileCubit>();
    },
    blocObserver: MyBlocObserver(),
  );
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
