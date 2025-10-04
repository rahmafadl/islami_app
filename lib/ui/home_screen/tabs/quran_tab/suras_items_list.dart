import 'package:flutter/material.dart';
import 'package:islami_app/ui/home_screen/tabs/quran_tab/quran_resourses.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_styles.dart';

class SurasItem extends StatelessWidget {
  const SurasItem({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(AppAssets.suraNum),
            Text('${index + 1}', style: AppStyles.whiteBold(20)),
          ],
        ),
        SizedBox(width: width * 0.05),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              QuranResourses.surahNamesEnglish[index],
              style: AppStyles.whiteBold(20),
            ),
            Text(
              QuranResourses.surahAyahsCount[index],
              style: AppStyles.whiteBold(14),
            ),
          ],
        ),
        Spacer(),
        Text(
          QuranResourses.surahNamesArabic[index],
          style: AppStyles.whiteBold(20),
        ),
      ],
    );
  }
}
