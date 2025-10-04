import 'package:flutter/material.dart';
import 'package:islami_app/model/hadeth_model.dart';
import 'package:islami_app/ui/home_screen/tabs/hadeth_tab/hadeth_details/hadeth_content.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_styles.dart';

class HadethDetailsScreen extends StatefulWidget {
  const HadethDetailsScreen({super.key});

  @override
  State<HadethDetailsScreen> createState() => _HadethDetailsScreenState();
}

class _HadethDetailsScreenState extends State<HadethDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    HadethModel hadeth = args['hadeth'];
    int index = args['index'];

    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        title: Text(
          hadeth.hadethTitlesEnglish[index - 1],
          style: AppStyles.goldBold(20),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(AppAssets.suraDetailsFrame)),
          // UI frame for Sura and Hadeth cards is the same
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: height * 0.02),
          child: Column(
            children: [
              SizedBox(height: height * 0.02),
              Text(hadeth.title, style: AppStyles.goldBold(24)),
              SizedBox(height: height * 0.06),
              Expanded(
                child: SingleChildScrollView(
                  child: HadethContent(content: hadeth.content),
                ),
              ),
              SizedBox(height: height * 0.15),
            ],
          ),
        ),
      ),
    );
  }
}
