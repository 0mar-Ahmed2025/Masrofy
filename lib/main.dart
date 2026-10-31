import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:masrofy/app.dart';
import 'package:masrofy/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await GoogleSignIn.instance.initialize(
    serverClientId:
        '667374987549-u8s518te5drpcjneanck84fcfree8tne.apps.googleusercontent.com',
  );
  await EasyLocalization.ensureInitialized();
  runApp(ProviderScope(child: const MyApp()));
}
