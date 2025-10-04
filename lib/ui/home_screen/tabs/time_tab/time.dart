import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_styles.dart';

class TimeItem extends StatelessWidget {
  final String name;
  final String time;

  const TimeItem({super.key, required this.name, required this.time});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    List<String> parts = time.split('\n');
    String hourMinute = parts[0];
    String amPm = parts.length > 1 ? parts[1] : '';

    return Container(
      width: width * 0.3,
      height: height * 0.4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: AppColors.gradientColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(name, style: AppStyles.whiteBold(20)),
          SizedBox(height: height * 0.001),
          Text(hourMinute, style: AppStyles.whiteBold(32)),
          Text(amPm, style: AppStyles.whiteBold(20)),
        ],
      ),
    );
  }
}

class TimeTab extends StatefulWidget {
  const TimeTab({super.key});

  @override
  State<TimeTab> createState() => _TimeTabState();
}

class _TimeTabState extends State<TimeTab> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    final prayerTimes = [
      {'name': 'Fajr', 'time': '05:24\nAM'},
      {'name': 'Sunrise', 'time': '06:50\nAM'},
      {'name': 'Dhuhr', 'time': '12:44\nPM'},
      {'name': 'Asr', 'time': '04:06\nPM'},
      {'name': 'Sunset', 'time': '06:37\nPM'},
      {'name': 'Maghrib', 'time': '06:38\nPM'},
      {'name': 'Isha', 'time': '07:55\nPM'},
    ];

    final azkarList = [
      {'name': 'Morning Azkar', 'image': AppAssets.morningAzkar},
      {'name': 'Evening Azkar', 'image': AppAssets.eveningAzkar},
      {'name': 'Sleep Azkar', 'image': AppAssets.sleepAzkar},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: width * 0.9,
          height: height * 0.3,
          decoration: BoxDecoration(
            color: AppColors.brownColor,
            borderRadius: BorderRadius.circular(40),
            image: DecorationImage(
              image: AssetImage(AppAssets.goldContainer),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: height * 0.01,
              horizontal: width * 0.04,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '16 Jul,\n 2024',
                      style: AppStyles.whiteBold(16),
                      textAlign: TextAlign.center,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Pray Time', style: AppStyles.blackBoldWith70(20)),
                        Text('Tuesday', style: AppStyles.blackBoldWith90(20)),
                      ],
                    ),
                    Text(
                      '09 Muh,\n 1446',
                      style: AppStyles.whiteBold(16),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                SizedBox(height: height * 0.02),
                Expanded(
                  child: CarouselSlider(
                    options: CarouselOptions(
                      enlargeCenterPage: true,
                      viewportFraction: 0.5,
                      enableInfiniteScroll: true,
                    ),
                    items: prayerTimes.map((prayer) {
                      return TimeItem(
                        name: prayer['name']!,
                        time: prayer['time']!,
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(height: height * 0.02),
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Next Pray ',
                            style: AppStyles.blackBoldWith70(16),
                          ),
                          Text('- 02:32', style: AppStyles.blackBoldWith90(16)),
                        ],
                      ),
                    ),
                    Icon(Icons.volume_up, color: Colors.black87),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: height * 0.03),
        Text('Azkar', style: AppStyles.whiteBold(16)),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: azkarList.length,
            itemBuilder: (context, index) {
              final azkar = azkarList[index];
              return Container(
                width: width * 0.4,
                height: height * 0.3,
                margin: EdgeInsets.symmetric(
                  horizontal: width * 0.02,
                  vertical: height * 0.02,
                ),
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: AppColors.blackColor,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColors.goldColor, width: 2.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(azkar['image']!, height: height * 0.15),
                    SizedBox(height: height * 0.02),
                    Text(
                      azkar['name']!,
                      style: AppStyles.whiteBold(18),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
