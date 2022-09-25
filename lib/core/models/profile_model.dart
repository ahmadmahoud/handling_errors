import 'package:handling_error/core/models/status_model.dart';
import 'package:handling_error/core/models/user_model.dart';

class ProfileModel {
  final StatusModel status;
  final UserModel? data;

  ProfileModel({
    required this.status,
    required this.data,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      status: StatusModel.fromJson(json['status']),
      data: UserModel.fromJson(json['data']),
    );
  }
}