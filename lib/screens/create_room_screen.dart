import 'package:flutter/material.dart';
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

  TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
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
                  text: 'Create Room',
                  fontSize: 70
              ),
              SizedBox(height: size.height * 0.08,),
                CustomTextField(
                    controller: controller,
                    hintText: 'Enter Your Nick Name'
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
