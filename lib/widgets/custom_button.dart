import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  const CustomButton({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25), // Rounded corners
        gradient: const LinearGradient(
          colors: [Colors.blueAccent, Colors.lightBlue], // Gradient colors
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.blue,
            blurRadius: 5,
            spreadRadius: 0
          ),
        ],
      ),
      child: ElevatedButton(
          onPressed: onTap,
          child: Text(text, style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold, fontSize: 18
          ),),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueAccent,
          minimumSize: Size(
              width,
              50
          )
        ),
      ),
    );
  }
}
