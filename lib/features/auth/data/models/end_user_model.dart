import 'package:problem_spark/features/auth/domain/entity/end_user.dart';

class EndUserModel extends EndUser {
  const EndUserModel({
    required super.name,
    required super.email,
    required super.password,
  });

  factory EndUserModel.fromJson(Map<String, dynamic> data) {
    return EndUserModel(
      name: data['name'],
      email: data['email'],
      password: data['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'email': email, 'password': password};
  }

  @override
  EndUserModel copyWith({String? name, String? email, String? password}) {
    return EndUserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  List<Object?> get props => [name, email, password];
}
