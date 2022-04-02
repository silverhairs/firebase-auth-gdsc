import 'package:chatting/app.dart';
import 'package:chatting/user_notifier.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    // We are providing a `UserChangeNotifier` to our whole application so that
    // any widget in the app can be able to interact with it.
    ChangeNotifierProvider(
      create: (context) => UserChangeNotifier(),
      child: const App(),
    ),
  );
}
