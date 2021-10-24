// ignore_for_file: file_names

import 'package:flutter/material.dart';

class SecondContainer extends StatelessWidget {
  final String? image;
  const SecondContainer({Key? key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 25),
      padding: const EdgeInsets.only(left: 13.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey.withOpacity(0.2),
      ),
      child: Center(
        child: AspectRatio(
          aspectRatio: 1.8,
          child: Image.asset(
            image!,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
