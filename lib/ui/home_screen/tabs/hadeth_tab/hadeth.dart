import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:islami_app/ui/home_screen/tabs/hadeth_tab/hadeth_items.dart';

class HadethTab extends StatelessWidget {
  const HadethTab({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return CarouselSlider(
      options: CarouselOptions(
        height: height * 0.66,
        enlargeCenterPage: true,
        enableInfiniteScroll: true,
      ),
      items: List.generate(50, (index) => index + 1).map((index) {
        return HadethItems(index: index);
      }).toList(),
    );
  }
}
