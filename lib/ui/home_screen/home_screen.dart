import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami_app/ui/home_screen/tabs/hadeth_tab/hadeth.dart';
import 'package:islami_app/ui/home_screen/tabs/quran_tab/quran.dart';
import 'package:islami_app/ui/home_screen/tabs/radio_tab/radio.dart';
import 'package:islami_app/ui/home_screen/tabs/sebha_tab/sebha.dart';
import 'package:islami_app/ui/home_screen/tabs/time_tab/time.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  List<String> backgroundImages = [
    AppAssets.quranBg,
    AppAssets.hadethBg,
    AppAssets.sebhaBg,
    AppAssets.radioBg,
    AppAssets.timeBg,
  ];
  List<Widget> tabs = [
    QuranTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab(),
  ];

  Widget builtTabContainer({required int index, required String tabName}) {
    return selectedIndex == index
        ? Container(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
            width: 59,
            height: 43,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(66),
              color: AppColors.blackColor.withAlpha(60),
            ),
            child: SvgPicture.asset(
              tabName,
              width: 19,
              height: 22,
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            ),
          )
        : SvgPicture.asset(
            tabName,
            width: 19,
            height: 22,
            colorFilter: ColorFilter.mode(
              selectedIndex == index ? Colors.white : Colors.black,
              BlendMode.srcIn,
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Image.asset(
          backgroundImages[selectedIndex],
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: builtTabContainer(index: 0, tabName: AppAssets.quranTab),
                label: 'Quran',
              ),
              BottomNavigationBarItem(
                icon: builtTabContainer(index: 1, tabName: AppAssets.hadethTab),
                label: 'Hadeth',
              ),
              BottomNavigationBarItem(
                icon: builtTabContainer(index: 2, tabName: AppAssets.sebhaTab),
                label: 'Sebha',
              ),
              BottomNavigationBarItem(
                icon: builtTabContainer(index: 3, tabName: AppAssets.radioTab),
                label: 'Radio',
              ),
              BottomNavigationBarItem(
                icon: builtTabContainer(index: 4, tabName: AppAssets.timeTab),
                label: 'Time',
              ),
            ],
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.15,
                    vertical: height * 0.03,
                  ),
                  child: Image.asset(AppAssets.isamiLogo),
                ),
                Expanded(child: tabs[selectedIndex]),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
