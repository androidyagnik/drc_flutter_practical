import 'package:drc_practical/constants/app_colors.dart';
import 'package:drc_practical/constants/app_images.dart';
import 'package:drc_practical/constants/app_size.dart';
import 'package:drc_practical/constants/app_text.dart';
import 'package:drc_practical/constants/strings.dart';
import 'package:drc_practical/pages/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [getBestSeller().marginOnly(top: size_150)],
        ),
      ),
    );
  }

  Widget getBannerSlider() {
    return Container();
  }

  Widget getBestSeller() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage(bgBestSeller))),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  child: Text(
                lblBestSeller,
                style: AppText.textBold
                    .copyWith(color: colorBlack, fontSize: font_16),
              )),
              Text(lblBestSeller,
                  style: AppText.textRegular
                      .copyWith(color: colorPink, fontSize: font_14))
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(size_20),
          decoration: BoxDecoration(color: colorLightPink),
          child: Container(
            decoration: BoxDecoration(
              color: colorWhite,
            ),
            child: SingleChildScrollView(
              padding: EdgeInsets.only(left: size_10),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: getBestSellerItemWidget(),
              ),
            ),
          ),
        )
      ],
    );
  }

  List<Widget> getBestSellerItemWidget() {
    List<Widget> itemWidget = [];

    for (int i = 0; i < 20; i++) {
      itemWidget.add(Container(
        width: size_150,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: size_150,
              decoration: BoxDecoration(color: colorLightGrey),
            ),
            Text(
              lblAvailable.toUpperCase(),
              style: AppText.textRegular
                  .copyWith(color: colorLightGrey, fontSize: font_14),
            ),
            Text(
              "Item Name",
              style: AppText.textBold
                  .copyWith(color: colorBlack, fontSize: font_16),
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ).marginOnly(top: size_5),
            Text(
              "AED 12.0",
              style: AppText.textRegular
                  .copyWith(color: colorPink, fontSize: font_14),
            ).marginOnly(top: size_12),
          ],
        ),
      ).marginOnly(right: size_10));
    }

    return itemWidget;
  }
}
