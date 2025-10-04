import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/provider/most_recently_provider.dart';
import 'package:islami_app/ui/home_screen/tabs/quran_tab/quran_resourses.dart';
import 'package:islami_app/ui/home_screen/tabs/quran_tab/sura_details/sura_content.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_styles.dart';
import 'package:provider/provider.dart';

class SuraDetailsScreen extends StatefulWidget {
  const SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  String suraContent = '';
  late MostRecentlyProvider mostRecentlyProvider;

  @override
  void dispose() {
    super.dispose();
    mostRecentlyProvider.readMostRecentList();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    int index = ModalRoute.of(context)!.settings.arguments as int;
    mostRecentlyProvider = Provider.of<MostRecentlyProvider>(context);
    if (suraContent.isEmpty) {
      loadSuraFile(index);
    }
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        title: Text(
          QuranResourses.surahNamesEnglish[index],
          style: AppStyles.goldBold(20),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(AppAssets.suraDetailsFrame)),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: height * 0.02),
          child: Column(
            children: [
              Text(
                QuranResourses.surahNamesArabic[index],
                style: AppStyles.goldBold(24),
              ),
              SizedBox(height: height * 0.06),
              Expanded(
                child: suraContent.isEmpty
                    ? Center(
                        child: CircularProgressIndicator(
                          color: AppColors.goldColor,
                        ),
                      )
                    : SingleChildScrollView(
                        child: SuraContent(content: suraContent),
                      ),
              ),
              SizedBox(height: height * 0.15),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> loadSuraFile(int index) async {
    String fileSurasContent = await rootBundle.loadString(
      'assets/files/quran_suras/${index + 1}.txt',
    );
    List<String> surasLines = fileSurasContent.split('\n');
    for (int i = 0; i < surasLines.length; i++) {
      surasLines[i] += "[${i + 1}]";
    }
    suraContent = surasLines.join();
    Future.delayed(const Duration(seconds: 1), () => setState(() {}));
    setState(() {});
  }
}
