import 'package:flutter/material.dart';
import 'package:islami_app/provider/most_recently_provider.dart';
import 'package:islami_app/ui/home_screen/home_screen.dart';
import 'package:islami_app/ui/home_screen/tabs/hadeth_tab/hadeth_details/hadeth_details_screen.dart';
import 'package:islami_app/ui/home_screen/tabs/quran_tab/sura_details/sura_details_screen.dart';
import 'package:islami_app/ui/introduction_screen/introduction_screen.dart';
import 'package:islami_app/utils/app_routes.dart';
import 'package:islami_app/utils/app_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => MostRecentlyProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.introductionRouteName,
      routes: {
        AppRoutes.introductionRouteName: (context) => OnBoardingPage(),
        AppRoutes.homeRouteName: (context) => HomeScreen(),
        AppRoutes.suraDetailsRouteName: (context) => SuraDetailsScreen(),
        AppRoutes.hadethDetailsRouteName: (context) => HadethDetailsScreen(),
      },
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}
