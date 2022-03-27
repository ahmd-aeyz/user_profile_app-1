import 'package:final_project/core/data/models/user_model.dart';
import 'package:final_project/core/domain/entities/user.dart';

extension Mapper on User {
  UserModel toModel() => UserModel(
        name: name,
        email: email,
        password: password,
        phone: phone,
        imageUrl: imageUrl,
        address: address,
        age: age,
      );
}
