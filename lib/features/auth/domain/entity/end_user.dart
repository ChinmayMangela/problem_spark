import 'package:equatable/equatable.dart';

class EndUser extends Equatable {
  final String id;
  final String name;
  final String email;
  final String password;
  final DateTime? createdAt;

  const EndUser({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    this.createdAt,
  });

  @override
  List<Object?> get props => [id, name, email, password, createdAt];
}
