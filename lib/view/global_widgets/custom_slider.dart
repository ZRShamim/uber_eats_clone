import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uber_eats_clone/view/theme/colors.dart';

/*
 * for slider home page
 */

class CustomSliderWidget extends StatelessWidget {
  final List items;

  const CustomSliderWidget({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var activeIndex = 0.obs;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: CarouselSlider(
            options: CarouselOptions(
              onPageChanged: (index, reason) {
                activeIndex.value = index;
              },
              enableInfiniteScroll: true,
              autoPlayCurve: Curves.fastLinearToSlowEaseIn,
              autoPlayAnimationDuration: const Duration(seconds: 2),
              // autoPlay: true,
              viewportFraction: 1.0,
            ),
            items: items.map((item) {
              return Builder(
                builder: (BuildContext context) {
                  return Stack(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Image(
                          image: AssetImage(item),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  );
                },
              );
            }).toList(),
          ),
        ),
        Obx(
          () => Positioned(
            left: 20,
            right: 0,
            bottom: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(items.length, (i) {
                return activeIndex.value == i
                    ? SliderDot(
                        dotColor: black,
                      )
                    : SliderDot(
                        dotColor: Colors.grey,
                      );
              }),
            ),
          ),
        )
      ],
    );
  }
}

class SliderDot extends StatelessWidget {
  SliderDot({required this.dotColor, Key? key}) : super(key: key);
  Color dotColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        width: 8,
        height: 8,
        decoration: BoxDecoration(
          color: dotColor,
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}
