import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:uber_eats_clone/models/json/home_page_json.dart';
import 'package:uber_eats_clone/view/global_widgets/custom_slider.dart';
import 'package:uber_eats_clone/view/theme/colors.dart';
import 'package:uber_eats_clone/view/theme/styles.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenWidth = ScreenUtil().screenWidth;
    return Scaffold(
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 15,
              ),
              const DeliveryTypeButton(),
              const SizedBox(
                height: 15,
              ),
              SearchBar(screenWidth: screenWidth),
              const SizedBox(height: 15,),
              const CustomSliderWidget(items: [
                'assets/images/slide_1.jpg',
                'assets/images/slide_2.jpg',
                'assets/images/slide_3.jpg',
              ])
            ],
          )
        ],
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
    required this.screenWidth,
  }) : super(key: key);

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Container(
              height: 45,
              width: screenWidth - 70,
              color: textFieldColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/images/pin_icon.svg',
                          width: 20,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          'Dhaka',
                          style: customContent,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Container(
                        height: 35,
                        color: white,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/images/time_icon.svg',
                                width: 20,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              const Text('Now', style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold
                              ),),
                              const Icon(Icons.keyboard_arrow_down)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(child: SvgPicture.asset('assets/images/filter_icon.svg'),),
      ],
    );
  }
}

class DeliveryTypeButton extends StatelessWidget {
  const DeliveryTypeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var activeMenu = 0.obs;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(menu.length, (index) {
        return Padding(
          padding: const EdgeInsets.only(right: 15),
          child: GestureDetector(
            onTap: () {
              activeMenu.value = index;
            },
            child: Obx(
              () => activeMenu.value == index
                  ? ElasticIn(
                      child: Chip(
                        labelPadding:
                            const EdgeInsets.symmetric(horizontal: 15),
                        backgroundColor: black,
                        label: Text(
                          menu[index],
                          style: const TextStyle(
                              color: white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    )
                  : Chip(
                      labelPadding: const EdgeInsets.symmetric(horizontal: 15),
                      backgroundColor: Colors.transparent,
                      label: Text(
                        menu[index],
                        style: const TextStyle(
                            color: black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
            ),
          ),
        );
      }),
    );
  }
}
