import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_styles.dart';

import 'radio_station.dart';

class RadioTab extends StatefulWidget {
  const RadioTab({super.key});

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  int selectedIndex = 0;

  List<RadioStation> stations = [
    RadioStation(title: "Radio Ibrahim Al-Akdar"),
    RadioStation(title: "Radio Al-Qaria Yassen"),
    RadioStation(title: "Radio Ahmed Al-trabulsi"),
    RadioStation(title: "Radio Addokali Mohammad"),
    RadioStation(title: "Radio Ibrahim Al-Akdar"),
    RadioStation(title: "Radio Al-Qaria Yassen"),
    RadioStation(title: "Radio Ahmed Al-trabulsi"),
    RadioStation(title: "Radio Addokali Mohammad"),
  ];
  List<RadioStation> reciters = [
    RadioStation(title: "Ibrahim Al-Akdar"),
    RadioStation(title: "Al-Qaria Yassen"),
    RadioStation(title: "Ahmed Al-trabulsi"),
    RadioStation(title: "Addokali Mohammad"),
    RadioStation(title: "Ibrahim Al-Akdar"),
    RadioStation(title: "Al-Qaria Yassen"),
    RadioStation(title: "Ahmed Al-trabulsi"),
    RadioStation(title: "Addokali Mohammad"),
  ];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: width * 0.04,
            vertical: height * 0.01,
          ),
          decoration: BoxDecoration(
            color: AppColors.blackColorWithOpacity70,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => setState(() => selectedIndex = 0),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: height * 0.01),
                    decoration: BoxDecoration(
                      color: selectedIndex == 0
                          ? AppColors.goldColor
                          : AppColors.blackColorWithOpacity70,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "Radio",
                      style: selectedIndex == 0
                          ? AppStyles.blackBold(16)
                          : AppStyles.whiteBold(16),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () => setState(() => selectedIndex = 1),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: height * 0.01),
                    decoration: BoxDecoration(
                      color: selectedIndex == 1
                          ? AppColors.goldColor
                          : AppColors.blackColorWithOpacity70,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "Reciters",
                      style: selectedIndex == 1
                          ? AppStyles.blackBold(16)
                          : AppStyles.whiteBold(16),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: height * 0.01),
        Expanded(
          child: selectedIndex == 0
              ? ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                  itemCount: stations.length,
                  itemBuilder: (context, index) {
                    return radioCard(stations[index], height, width);
                  },
                )
              : ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                  itemCount: reciters.length,
                  itemBuilder: (context, index) {
                    return radioCard(reciters[index], height, width);
                  },
                ),
        ),
      ],
    );
  }

  Widget radioCard(RadioStation station, double height, double width) {
    return Container(
      margin: EdgeInsets.only(bottom: height * 0.02),
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.02,
        vertical: height * 0.02,
      ),
      decoration: BoxDecoration(
        color: AppColors.goldColor,
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(
            station.isPlaying ? AppAssets.soundWave : AppAssets.mosque,
          ),
          fit: BoxFit.contain,
          alignment: Alignment.bottomCenter,
          opacity: 0.9,
        ),
      ),
      child: Column(
        children: [
          Center(child: Text(station.title, style: AppStyles.blackBold(20))),
          SizedBox(height: height * 0.03),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    station.isPlaying = !station.isPlaying;
                  });
                },
                child: SvgPicture.asset(
                  station.isPlaying
                      ? AppAssets.pauseSound
                      : AppAssets.playSound,
                  width: width * 0.03,
                  height: height * 0.03,
                ),
              ),

              SizedBox(width: width * 0.03),
              GestureDetector(
                onTap: () {
                  setState(() {
                    station.isMuted = !station.isMuted;
                  });
                },
                child: SvgPicture.asset(
                  station.isMuted
                      ? AppAssets.muteSound
                      : AppAssets.notMuteSound,
                  width: width * 0.03,
                  height: height * 0.03,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
