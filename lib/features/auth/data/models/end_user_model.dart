import 'package:problem_spark/features/auth/domain/entity/end_user.dart';

class EndUserModel extends EndUser {
  const EndUserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.password,
  });

  factory EndUserModel.fromJson(Map<String, dynamic> data, String id) {
    return EndUserModel(
      id: id,
      name: data['name'],
      email: data['email'],
      password: data['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'email': email, 'password': password};
  }

  EndUserModel copyWith({String? name, String? email, String? password}) {
    return EndUserModel(
      id: id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  List<Object?> get props => [id, name, email, password];
}
