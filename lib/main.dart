import 'package:flash_chat_flutter/screens/chat_screen.dart';
import 'package:flash_chat_flutter/screens/login_screen.dart';
import 'package:flash_chat_flutter/screens/registration_screen.dart';
import 'package:flash_chat_flutter/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return ErrorWidget(snapshot.error!);
        }
        print('snapshot.connectionState: ${snapshot.connectionState}');
        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return const FlashChat();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return const CircularProgressIndicator();
      },
    );
  }
}

class FlashChat extends StatelessWidget {
  const FlashChat({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomeScreen.id,
      routes: <String, WidgetBuilder>{
        LoginScreen.id: (BuildContext context) => LoginScreen(),
        WelcomeScreen.id: (BuildContext context) => const WelcomeScreen(),
        ChatScreen.id: (BuildContext context) => ChatScreen(),
        RegistrationScreen.id: (BuildContext context) => RegistrationScreen(),
      },
    );
  }
}
