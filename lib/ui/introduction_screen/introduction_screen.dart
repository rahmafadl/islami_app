import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islami_app/ui/home_screen/home_screen.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_colors.dart';

import '../../utils/app_styles.dart';
import 'build_page_widget.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      globalBackgroundColor: AppColors.blackColor,
      pages: [
        PageViewModel(
          title: "",
          body: "",
          image: buildPage(
            context: context,
            imageAsset: AppAssets.introOne,
            text1: 'Welcome To Islami App',
            heightBetweenImageAndText1: 0.08,
          ),
          decoration: const PageDecoration(
            pageColor: AppColors.blackColor,
            fullScreen: true,
          ),
        ),
        PageViewModel(
          title: "",
          body: "",
          image: buildPage(
            context: context,
            imageAsset: AppAssets.introTwo,
            text1: 'Welcome To Islami ',
            text2: 'We Are Very Excited To Have You In Our Community ',
            heightBetweenImageAndText1: 0.04,
          ),
          decoration: const PageDecoration(
            pageColor: AppColors.blackColor,
            fullScreen: true,
          ),
        ),
        PageViewModel(
          title: "",
          body: "",
          image: buildPage(
            context: context,
            imageAsset: AppAssets.introThree,
            text1: 'Reading the Quran',
            text2: 'Read, and your Lord is The Most Generous ',
            heightBetweenImageAndText1: 0.04,
          ),
          decoration: const PageDecoration(
            pageColor: AppColors.blackColor,
            fullScreen: true,
          ),
        ),
        PageViewModel(
          title: "",
          body: "",
          image: buildPage(
            context: context,
            imageAsset: AppAssets.introFour,
            text1: 'Bearish ',
            text2: ' Praise the name of your Lord, the Most High',
            heightBetweenImageAndText1: 0.04,
          ),
          decoration: const PageDecoration(
            pageColor: AppColors.blackColor,
            fullScreen: true,
          ),
        ),
        PageViewModel(
          title: "",
          body: "",
          image: buildPage(
            context: context,
            imageAsset: AppAssets.introFive,
            text1: 'Holy Quran Radio',
            text2:
                ' You can listen to the Holy Quran radio through the application for free and easily',
            heightBetweenImageAndText1: 0.04,
          ),
          decoration: const PageDecoration(
            pageColor: AppColors.blackColor,
            fullScreen: true,
          ),
        ),
      ],
      showBackButton: currentPage != 0,
      back: Text("Back", style: AppStyles.goldBold(16)),
      next: Text("Next", style: AppStyles.goldBold(16)),
      done: Text("Finish", style: AppStyles.goldBold(16)),
      onDone: () {
        Navigator.of(
          context,
        ).pushReplacement(MaterialPageRoute(builder: (_) => HomeScreen()));
      },
      nextStyle: TextButton.styleFrom(overlayColor: AppColors.goldColor),
      doneStyle: TextButton.styleFrom(overlayColor: AppColors.goldColor),
      backStyle: TextButton.styleFrom(overlayColor: AppColors.goldColor),
      onChange: (index) {
        setState(() {
          currentPage = index;
        });
      },
      dotsDecorator: const DotsDecorator(
        size: Size(7, 7),
        color: AppColors.grayColor,
        activeColor: AppColors.goldColor,
        spacing: EdgeInsets.all(7),
        activeSize: Size(18, 7),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(27)),
        ),
      ),
    );
  }
}
