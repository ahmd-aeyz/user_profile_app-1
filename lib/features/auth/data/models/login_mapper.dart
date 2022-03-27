import 'package:final_project/features/auth/data/models/login_model.dart';
import 'package:final_project/features/auth/domain/entities/login_entity.dart';

extension Mapper on LoginEntity {
  LoginModel toModel() => LoginModel(
        email: email,
        password: password,
      );
}
