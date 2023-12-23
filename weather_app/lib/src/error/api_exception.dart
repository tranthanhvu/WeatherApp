import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class APIException extends Equatable implements Exception {
  const APIException(this.errorCode);

  final String errorCode;

  String getAPIExceptionMessage(BuildContext context) {
    return 'APIException: $errorCode';
  }

  @override
  List<Object?> get props => [
        errorCode,
      ];
}
