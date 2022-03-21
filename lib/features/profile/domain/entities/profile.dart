import 'package:equatable/equatable.dart';

class Profile extends Equatable {
  final String name;
  final String email;
  final String password;
  final String phone;
  final String imageUrl;
  final String job;

  const Profile({
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
    required this.imageUrl,
    required this.job,
  });

  @override
  List<Object?> get props => [
        name,
        email,
        password,
        phone,
        imageUrl,
        job,
      ];
}
