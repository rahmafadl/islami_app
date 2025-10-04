import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_styles.dart';

import '../../../../utils/app_assets.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  List<String> azkar = [
    'سُبْحَانَ اللَّهِ',
    'الْحَمْدُ لِلَّهِ',
    'اللَّهُ أَكْبَر',
    'لا إِلَهَ إِلا اللَّهُ',
  ];

  int number = 0;

  String currentZekr() {
    if (number <= 33) return azkar[0];
    if (number <= 66) return azkar[1];
    if (number <= 99) return azkar[2];
    if (number == 100) return azkar[3];
    return azkar[0];
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Text(
          'سَبِّحِ اسْمَ رَبِّكَ الْأَعْلَى',
          style: AppStyles.whiteBold(35),
        ),
        SizedBox(height: height * 0.03),
        Stack(
          alignment: Alignment.center,
          children: [
            InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                setState(() {
                  number++;
                });
                if (number > 100) {
                  number = 0;
                }
              },
              child: Image.asset(AppAssets.sebha),
            ),
            Text(currentZekr(), style: AppStyles.whiteBold(36)),
            Padding(
              padding: EdgeInsets.only(top: height * 0.18),
              child: Text(number.toString(), style: AppStyles.whiteBold(36)),
            ),
          ],
        ),
      ],
    );
  }
}
