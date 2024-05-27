import 'data.dart';

class Usermodel {
  bool? status;
  String? message;
  Data? data;

  Usermodel({this.status, this.message, this.data});

  factory Usermodel.fromJson(Map<String, dynamic> json) => Usermodel(
        status: json['status'] as bool?,
        message: json['message'] as String?,
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.toJson(),
      };
}
