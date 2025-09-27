import 'package:equatable/equatable.dart';

class EndUser extends Equatable {
  final String name;
  final String email;
  final String password;

  const EndUser({
    required this.name,
    required this.email,
    required this.password,
  });

  EndUser copyWith({String? name, String? email, String? password}) {
    return EndUser(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  List<Object?> get props => [name, email, password];
}
