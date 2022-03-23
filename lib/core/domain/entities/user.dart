import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String name;
  final String email;
  final String phone;
  final String? address;
  final String? imageUrl;
  final int? age;

  const User({
    required this.name,
    required this.email,
    required this.phone,
    this.address,
    this.imageUrl,
    this.age,
  });

  @override
  List<Object?> get props => [
        name,
        email,
        phone,
        address,
        imageUrl,
        age,
      ];
}
