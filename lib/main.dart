import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_application/appstate.dart';
import 'package:flutter_chat_application/firebase_options.dart';
import 'package:flutter_chat_application/homepage.dart';
import 'package:flutter_chat_application/signin.dart';
import 'package:flutter_chat_application/signup.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    ChangeNotifierProvider(
      create: (_) => AppState(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Consumer<AppState>(
        builder: (context, appState, _) {
          return appState.isLoggedIn ? SignUp() : SignIn();
        },
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}