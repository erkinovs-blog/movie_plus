import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class EmailService {
  static const _username = String.fromEnvironment("username",
      defaultValue: "murodjonerkinov2005@gmail.com");
  static const _passKey =
      String.fromEnvironment("pass_key", defaultValue: "vzdxczwlcivwxmou");
  static final _server = gmail(_username, _passKey);
  static final random = Random();
  late int _otp;

  Timer? timer;

  void dispose() => timer?.cancel();

  bool? verify({required String otp}) {
    if (timer?.isActive ?? false) {
      return _otp.toString() == otp;
    } else {
      return null;
    }
  }

  Future<bool> sendOTP({required String toEmail}) async {
    if (timer?.isActive ?? false) {
      return true;
    } else {
      _otp = random.nextInt(9000) + 1000;
      await Future.delayed(const Duration(seconds: 1));
      final message = Message()
        ..from = const Address(_username, "Movie Plus")
        ..recipients.add(toEmail)
        ..subject = "Get Verification Code"
        ..text = "Your OTP is $_otp";

      try {
        final sendReport =
            await send(message, _server, timeout: const Duration(seconds: 10));
        debugPrint("Send: ${sendReport.toString()}");
        timer = Timer(
          const Duration(minutes: 3),
          () {
            timer?.cancel();
          },
        );
        return true;
      } catch (e) {
        debugPrint("Error: $e");
        return false;
      }
    }
  }
}
