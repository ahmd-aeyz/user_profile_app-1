import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String email;
  final String password;
  final String token;

  const UserModel({
    required this.email,
    required this.password,
    required this.token,
  });

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
        'token': token,
      };

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        email: json['email'] as String,
        password: json['password'] as String,
        token: json['token'] as String,
      );

  @override
  List<Object?> get props => [
        email,
        password,
        token,
      ];
}
