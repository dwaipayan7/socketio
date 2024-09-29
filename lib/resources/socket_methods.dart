import 'package:flutter/material.dart';
import 'package:socketio/resources/socket_client.dart';
import 'package:socketio/screens/game_screen.dart';

class SocketMethods {
  final _socketClient = SocketClient.instance.socket!;

  void createRoom(String nickname) {
    // Emit only if the nickname is not empty
    if (nickname.isNotEmpty) {
      _socketClient.emit('createRoom', {
        'nickname': nickname,
      });
    } else {
      print('Nickname cannot be empty');
    }
  }

  void createRoomSuccessListener(BuildContext context) {
    _socketClient.on('CreateRoomSuccess', (room) {
      print(room);
      Navigator.pushNamed(
        context,
        GameScreen.routeName
        );
    });
  }
}
