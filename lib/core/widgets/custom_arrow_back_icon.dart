import 'package:flutter/material.dart';
import 'package:online_exam/config/routing/routing_extensions.dart';

class CustomArrowBackIcon extends StatelessWidget {
  const CustomArrowBackIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios_new),
      onPressed: () {
        context.pop();
      },
    );
  }
}
