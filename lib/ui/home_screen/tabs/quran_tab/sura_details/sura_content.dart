import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_styles.dart';

class SuraContent extends StatelessWidget {
  final String content;

  const SuraContent({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: width * 0.02),
      child: Text(
        content,
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.center,
        style: AppStyles.goldBold(20),
      ),
    );
  }
}
