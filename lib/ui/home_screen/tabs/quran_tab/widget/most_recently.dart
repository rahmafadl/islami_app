import 'package:flutter/material.dart';
import 'package:islami_app/ui/home_screen/tabs/quran_tab/quran_resourses.dart';
import 'package:provider/provider.dart';

import '../../../../../provider/most_recently_provider.dart';
import '../../../../../utils/app_assets.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_styles.dart';

class MostRecently extends StatefulWidget {
  const MostRecently({super.key});

  @override
  State<MostRecently> createState() => _MostRecentlyState();
}

class _MostRecentlyState extends State<MostRecently> {
  List<int> mostRecentList = [];
  late MostRecentlyProvider mostRecentlyProvider;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      mostRecentlyProvider.readMostRecentList();
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    mostRecentlyProvider = Provider.of<MostRecentlyProvider>(context);
    return Visibility(
      visible: mostRecentlyProvider.mostRecentList.isNotEmpty,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Most Recently', style: AppStyles.whiteBold(16)),
          SizedBox(height: height * 0.02),
          SizedBox(
            height: height * 0.18,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                  decoration: BoxDecoration(
                    color: AppColors.goldColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            QuranResourses
                                .surahNamesEnglish[mostRecentlyProvider
                                .mostRecentList[index]],
                            style: AppStyles.blackBold(24),
                          ),
                          Text(
                            QuranResourses.surahNamesArabic[mostRecentlyProvider
                                .mostRecentList[index]],
                            style: AppStyles.blackBold(24),
                          ),
                          Text(
                            QuranResourses.surahAyahsCount[mostRecentlyProvider
                                .mostRecentList[index]],
                            style: AppStyles.blackBold(14),
                          ),
                        ],
                      ),
                      Image.asset(AppAssets.quranSura),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) =>
                  SizedBox(width: width * 0.03),
              itemCount: mostRecentlyProvider.mostRecentList.length,
            ),
          ),
          SizedBox(height: height * 0.02),
        ],
      ),
    );
  }
}
