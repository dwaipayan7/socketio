import 'package:flutter/material.dart';

import '../responsive/responsive.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_text_field.dart';

class JoinRoomScreen extends StatefulWidget {
  static String routeName = '/join-room';
  const JoinRoomScreen({super.key});

  @override
  State<JoinRoomScreen> createState() => _CreateRoomScreenState();
}

class _CreateRoomScreenState extends State<JoinRoomScreen> {

  TextEditingController _gameIdController = TextEditingController();
  TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _gameIdController.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Responsive(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20,),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomText(
                  shadows: [
                    Shadow(
                        blurRadius: 40,
                        color: Colors.blue
                    )
                  ],
                  text: 'Join Room',
                  fontSize: 70
              ),
              SizedBox(height: size.height * 0.08,),
              CustomTextField(
                  controller: _nameController,
                  hintText: 'Enter Your Nick Name'
              ),
              SizedBox(height: 20,),
              CustomTextField(
                  controller: _gameIdController,
                  hintText: 'Enter Game ID'
              ),
              SizedBox(height: size.height * 0.045,),
              CustomButton(onTap: (){}, text: 'Create')
            ],
          ),
        ),
      ),
    );
  }
  }