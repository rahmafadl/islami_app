import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami_app/ui/home_screen/tabs/quran_tab/quran_resourses.dart';
import 'package:islami_app/ui/home_screen/tabs/quran_tab/suras_items_list.dart';
import 'package:islami_app/ui/home_screen/tabs/quran_tab/widget/most_recently.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_routes.dart';
import 'package:islami_app/utils/app_styles.dart';

import '../../../../utils/shared_preference.dart';

class QuranTab extends StatefulWidget {
  const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  List<int> filterList = List.generate(114, (index) => index);

  OutlineInputBorder buidBorderSide() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: AppColors.goldColor, width: 2),
    );
  }

  void searchByNewText(String newText) {
    List<int> resultList = [];
    for (int i = 0; i < 114; i++) {
      if (QuranResourses.surahNamesArabic[i].contains(newText) ||
          QuranResourses.surahNamesEnglish[i].toLowerCase().contains(
            newText.toLowerCase(),
          )) {
        resultList.add(i);
      }
    }
    setState(() {
      filterList = resultList;
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          style: AppStyles.whiteBold(16),
          cursorColor: AppColors.goldColor,
          decoration: InputDecoration(
            enabledBorder: buidBorderSide(),
            focusedBorder: buidBorderSide(),
            prefixIcon: Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.03),
              child: SvgPicture.asset(AppAssets.quranSearch),
            ),
            hintText: 'Sura Name',
            hintStyle: AppStyles.whiteBold(16),
          ),
          onChanged: (newText) {
            searchByNewText(newText);
          },
        ),
        SizedBox(height: height * 0.02),
        MostRecently(),
        Text('Suras List', style: AppStyles.whiteBold(16)),
        SizedBox(height: height * 0.02),
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  saveLastSura(filterList[index]);
                  Navigator.of(context).pushNamed(
                    AppRoutes.suraDetailsRouteName,
                    arguments: filterList[index],
                  );
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: height * 0.01),
                  child: SurasItem(index: filterList[index]),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return Divider(
                color: AppColors.whiteColor,
                indent: width * 0.10,
                endIndent: width * 0.10,
              );
            },
            itemCount: filterList.length,
          ),
        ),
      ],
    );
  }
}
