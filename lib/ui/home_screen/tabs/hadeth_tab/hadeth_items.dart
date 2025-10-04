import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/model/hadeth_model.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_routes.dart';
import 'package:islami_app/utils/app_styles.dart';

class HadethItems extends StatefulWidget {
  final int index;

  const HadethItems({super.key, required this.index});

  @override
  State<HadethItems> createState() => _HadethItemsState();
}

class _HadethItemsState extends State<HadethItems> {
  HadethModel? hadeth;

  @override
  void initState() {
    super.initState();
    loadHadethFiles();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          AppRoutes.hadethDetailsRouteName,
          arguments: {'hadeth': hadeth, 'index': widget.index},
        );
      },
      child: Container(
        width: width * 0.98,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.goldColor,
        ),
        child: hadeth == null
            ? Center(
                child: CircularProgressIndicator(color: AppColors.blackColor),
              )
            : Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: height * 0.02),
                    child: Image.asset(
                      AppAssets.hadethCard,
                      fit: BoxFit.fill,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(height: height * 0.04),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                        child: Text(
                          hadeth?.title ?? '',
                          textAlign: TextAlign.center,
                          style: AppStyles.blackBold(24),
                        ),
                      ),
                      SizedBox(height: height * 0.04),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: width * 0.07,
                            ),
                            child: Text(
                              hadeth?.content ?? '',
                              textAlign: TextAlign.center,
                              style: AppStyles.blackBold(16),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.08),
                    ],
                  ),
                ],
              ),
      ),
    );
  }

  Future<void> loadHadethFiles() async {
    String fileContent = await rootBundle.loadString(
      'assets/files/hadeth/h${widget.index}.txt',
    );
    List<String> hadethLines = fileContent.split('\n');
    for (int i = 0; i < hadethLines.length; i++) {
      String title = fileContent.substring(0, fileContent.indexOf('\n'));
      String content = fileContent.substring(fileContent.indexOf('\n') + 1);
      hadeth = HadethModel(title: title, content: content);
      await Future.delayed(Duration(seconds: 1));
      setState(() {});
    }
  }
}
