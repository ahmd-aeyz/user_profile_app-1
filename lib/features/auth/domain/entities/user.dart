import 'package:final_project/features/auth/data/models/user_model.dart';

class User extends UserModel {
  const User({
    required String email,
    required String password,
    required String token,
  }) : super(
          email: email,
          password: password,
          token: token,
        );
}
