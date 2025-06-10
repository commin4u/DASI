import 'package:dasi/app/app.dart';
import 'package:dasi/bootstrap.dart';
import 'package:dasi/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await bootstrap(App.new);
}
