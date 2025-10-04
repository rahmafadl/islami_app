import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_styles.dart';

class TimeItem extends StatelessWidget {
  final String name;
  final String time;

  const TimeItem({super.key, required this.name, required this.time});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Container(
      width: width * 0.3,
      height: height * 0.4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: AppColors.gradientColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            name,
            style: AppStyles.whiteBold(20),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: height * 0.02),
          Text(
            time,
            style: AppStyles.whiteBold(20),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
