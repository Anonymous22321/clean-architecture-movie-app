/// Error Model is modified based on the error come from api
library;

import 'package:equatable/equatable.dart';

class ErrorModel extends Equatable {
  final String statusMessage;
  final int statusCode;
  final bool success;

  const ErrorModel({
    required this.statusMessage,
    required this.statusCode,
    required this.success,
  });

  factory ErrorModel.fromJson(Map<String, dynamic> map) {
    return ErrorModel(
      statusMessage: map["status_message"],
      statusCode: map["status_code"],
      success: map["success"],
    );
  }

  @override
  List<Object?> get props => [statusMessage, statusCode, success];
}
