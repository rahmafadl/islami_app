import 'package:flutter/material.dart';

class AppColors {
  static const Color blackColor = Color(0XFF202020);
  static const Color blackColorWithOpacity70 = Color.fromRGBO(32, 32, 32, 0.7);
  static const Color blackColorWithOpacity90 = Color.fromRGBO(32, 32, 32, 0.9);
  static const Color goldColor = Color(0XFFE2BE7F);
  static const Color grayColor = Color(0XFF707070);
  static const Color whiteColor = Color(0XFFFFFFFF);
  static const Color offWhiteColor = Color(0XFFFFF5E3);
  static const Color brownColor = Color(0XFF856B3F);
  static const transparentColor = Colors.transparent;
  static const LinearGradient gradientColor = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0XFF202020), Color(0XFFB19768)],
  );
}
