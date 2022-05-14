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
          children: [
            widgetBestSeller().marginOnly(top: size_150),
            getOfferItemBanner()
          ],
        ),
      ),
    );
  }

  Widget widgetBannerSlider() {
    return Container();
  }

  Widget widgetBestSeller() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(size_15),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(bgBestSeller), fit: BoxFit.fill)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  child: Text(
                    lblBestSeller,
                    style: AppText.textBold
                        .copyWith(color: colorBlack, fontSize: font_18),
                  )),
              Text(lblSeeAll,
                  style: AppText.textRegular
                      .copyWith(color: colorPink, fontSize: font_16))
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(size_15),
          decoration: BoxDecoration(color: colorLightGrey),
          child: Container(
            decoration: BoxDecoration(
              color: colorWhite,
            ),
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(
                  left: size_10, top: size_10, bottom: size_10),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: itemWidgetBestSeller(),
              ),
            ),
          ),
        )
      ],
    );
  }

  List<Widget> itemWidgetBestSeller() {
    List<Widget> itemWidget = [];

    for (int i = 0; i < 20; i++) {
      itemWidget.add(SizedBox(
        width: size_150,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: size_250,
              decoration: BoxDecoration(color: colorLightGrey),
            ),
            Text(
              lblAvailable.toUpperCase(),
              style: AppText.textRegular
                  .copyWith(color: Colors.grey, fontSize: font_16),
            ).marginOnly(top: size_5),
            Text(
              "Item Name",
              style: AppText.textBold
                  .copyWith(color: colorBlack, fontSize: font_18),
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ).marginOnly(top: size_3),
            Text(
              "AED 12.0",
              style: AppText.textBold
                  .copyWith(color: colorPink, fontSize: font_16),
            ).marginOnly(top: size_12),
          ],
        ),
      ).marginOnly(right: size_10));
    }

    return itemWidget;
  }

  Widget getOfferItemBanner() {
    List<Widget> itemWidget = [];

    for (int i = 0; i < 10; i++) {
      itemWidget.add(
          ClipRRect(
            child: Container(
              width: (MediaQuery
                  .of(Get.context!)
                  .size
                  .width - size_20),
              height: size_150,
              decoration: BoxDecoration(
                  color: colorLightPink,
                  borderRadius: BorderRadius.circular(size_10)
              ),
            ),
          ).marginOnly(right: i ==9 ? size_0:size_20)
      );
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.all(size_20),
      child: Row(
        children: itemWidget,
      ),
    );
  }

  Widget widgetSeeMoreCategories(){
    return Container();
  }
}
