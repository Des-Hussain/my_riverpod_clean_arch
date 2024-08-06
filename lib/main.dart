import 'dart:io';
import 'package:flutter/material.dart';
import 'package:my_riverpod_clean_arch/presentation/app.dart';
import 'package:my_riverpod_clean_arch/services/local_storage.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();

  LocalStorageService.instance.init();
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const RiverpodCleanArch());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
