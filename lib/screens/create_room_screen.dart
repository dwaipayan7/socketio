import 'package:flutter/material.dart';
import 'package:socketio/resources/socket_methods.dart';
import 'package:socketio/responsive/responsive.dart';
import 'package:socketio/widgets/custom_button.dart';
import 'package:socketio/widgets/custom_text.dart';
import 'package:socketio/widgets/custom_text_field.dart';

class CreateRoomScreen extends StatefulWidget {
  static String routeName = '/create-room';
  const CreateRoomScreen({super.key});

  @override
  State<CreateRoomScreen> createState() => _CreateRoomScreenState();
}

class _CreateRoomScreenState extends State<CreateRoomScreen> {
  final TextEditingController _nameController = TextEditingController();
  final SocketMethods _socketMethods = SocketMethods();

  @override
  void dispose() {
    // Dispose the controller to avoid memory leaks
    super.dispose();
    _nameController.dispose();
  }

  @override
  void initState() {
    super.initState();
    _socketMethods.createRoomSuccessListener(context);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Responsive(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomText(
                shadows: [
                  Shadow(blurRadius: 40, color: Colors.blue),
                ],
                text: 'Create Room',
                fontSize: 70,
              ),
              SizedBox(height: size.height * 0.08),
              CustomTextField(
                controller: _nameController,
                hintText: 'Enter Your Nickname',
              ),
              SizedBox(height: size.height * 0.045),
              CustomButton(
                onTap: () {
                  // Print nickname for debugging
                  print('Nickname entered: ${_nameController.text}');
                  _socketMethods.createRoom(_nameController.text);
                },
                text: 'Create',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
