import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_styles.dart';

import '../../utils/app_assets.dart';

Widget buildPage({
  required BuildContext context,
  required String imageAsset,
  required String text1,
  String? text2,
  required double heightBetweenImageAndText1,
}) {
  var width = MediaQuery.of(context).size.width;
  var height = MediaQuery.of(context).size.height;

// Removed SingleChildScrollView for now to fix layout on phones.
// Will re-add and adjust sizes later for tablets and larger screens.

  return Column(
    children: [
      Padding(
        padding: EdgeInsets.symmetric(
          vertical: height * 0.02,
          horizontal: width * 0.16,
        ),
        child: Image.asset(AppAssets.isamiLogo),
      ), //logo
      SizedBox(height: height * 0.1),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.06),
        child: Image.asset(imageAsset),
      ), //image
      SizedBox(height: height * heightBetweenImageAndText1),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: height * 0.09),
        child: Text(text1, style: AppStyles.goldBold(24)),
      ), //text1
      SizedBox(height: height * 0.04),
      if (text2 != null)
        Padding(
          padding: EdgeInsets.symmetric(horizontal: height * 0.02),
          child: Text(
            text2,
            textAlign: TextAlign.center,
            style: AppStyles.goldBold(20),
          ),
        ), //text2
    ],
  );
}
