import 'package:flutter/material.dart';
import 'package:socketio/responsive/responsive.dart';
import 'package:socketio/screens/create_room_screen.dart';
import 'package:socketio/screens/join_room_screen.dart';
import 'package:socketio/widgets/custom_button.dart';

class MainMenuScreen extends StatelessWidget {
  static String routeName = '/main-menu';
  const MainMenuScreen({super.key});

  void createRoom(BuildContext context){
    Navigator.pushNamed(context, CreateRoomScreen.routeName);
  }

  void joinRoom(BuildContext context){
    Navigator.pushNamed(context, JoinRoomScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Responsive(
          child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
          CustomButton(onTap: () {
            createRoom(context);
          }, text: 'Create Room'),
          SizedBox(height: 15,),
          CustomButton(onTap: () {
            joinRoom(context);
          }, text: 'Join Room'),
                ],
              ),
        ));
  }
}
