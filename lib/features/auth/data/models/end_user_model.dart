import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:problem_spark/common/entity/end_user.dart';

class EndUserModel extends EndUser {
  const EndUserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.password,
    super.createdAt,
  });

  factory EndUserModel.fromJson(Map<String, dynamic> data, String id) {
    final createdAt = data['createdAt'] as Timestamp;
    return EndUserModel(
      id: id,
      name: data['name'],
      email: data['email'],
      password: data['password'],
      createdAt: createdAt.toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'createdAt': createdAt != null ? Timestamp.fromDate(createdAt!) : null,
    };
  }

  EndUserModel copyWith({String? name, String? email, String? password}) {
    return EndUserModel(
      id: id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      createdAt: createdAt
    );
  }

  @override
  List<Object?> get props => [id, name, email, password];
}
