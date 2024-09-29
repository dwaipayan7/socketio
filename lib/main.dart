import 'package:flutter/material.dart';
import 'package:socketio/screens/create_room_screen.dart';
import 'package:socketio/screens/game_screen.dart';
import 'package:socketio/screens/join_room_screen.dart';
import 'package:socketio/screens/main_menu_screen.dart';
import 'package:socketio/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Socket IO',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor
      ),
      routes: {
        MainMenuScreen.routeName: (context) => const MainMenuScreen(),
        JoinRoomScreen.routeName: (context) => const JoinRoomScreen(),
        CreateRoomScreen.routeName: (context) => const CreateRoomScreen(),
        GameScreen.routeName: (context) => const GameScreen(),

      },
      initialRoute: MainMenuScreen.routeName,
    );
  }
}


