import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

enum AppErrorCode {
  parseError,
  invalidParams,
  unknown;

  String getMessage(BuildContext context) {
    switch (this) {
      case AppErrorCode.parseError:
        return 'Parse error';
      case AppErrorCode.invalidParams:
        return 'Invalid parameters';
      default:
        return 'Unknown';
    }
  }
}

class AppException extends Equatable implements Exception {
  const AppException(this.errorCode);

  final AppErrorCode errorCode;

  String getAppExceptionMessage(BuildContext context) {
    return errorCode.getMessage(context);
  }

  @override
  List<Object?> get props => [
        errorCode,
      ];
}
