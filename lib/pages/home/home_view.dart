import 'package:drc_practical/apiservice/model/home_page_response_model.dart';
import 'package:drc_practical/constants/app_colors.dart';
import 'package:drc_practical/constants/app_images.dart';
import 'package:drc_practical/constants/app_size.dart';
import 'package:drc_practical/constants/app_text.dart';
import 'package:drc_practical/constants/strings.dart';
import 'package:drc_practical/pages/home/home_controller.dart';
import 'package:drc_practical/widgets/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: colorWhite,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: colorWhite,
        title: Text(
          "Annabelle",
          style:
              AppText.textMedium.copyWith(color: colorPink, fontSize: font_18),
        ),
        elevation: 0.0,
      ),
      body: Obx(() => controller.isAPICall.value
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : (controller.homeResponse.value.status ?? "") == "200"
              ? SingleChildScrollView(
                  padding: const EdgeInsets.only(bottom: size_30),
                  child: Column(
                    children: [
                      widgetBannerSlider(),
                      widgetBestSeller().marginOnly(top: size_20),
                      widgetOfferItemBanner(),
                      widgetSeeMoreCategories(),
                      widgetProductWithCategory(),
                      widgetShopByBrands()
                    ],
                  ),
                )
              : Center(
                  child: Text(
                    lblSomethingWentWrong,
                    style: AppText.textBold
                        .copyWith(color: colorPink, fontSize: size_18),
                  ),
                )),
    );
  }

  Widget widgetBannerSlider() {
    List<Widget> itemWidget = [];

    for (BannerSlider slider
        in controller.homeResponse.value.data?.bannerSlider ?? []) {
      itemWidget.add(getNetworkImage(
        slider.mobileImage ?? "",
        MediaQuery.of(Get.context!).size.width,
        MediaQuery.of(Get.context!).size.width,
      ));
    }

    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(Get.context!).size.width,
            height : MediaQuery.of(Get.context!).size.width,
            child: PageView(

                /// [PageView.scrollDirection] defaults to [Axis.horizontal].
                /// Use [Axis.vertical] to scroll vertically.
                controller: controller.pageController,
                children: itemWidget),
          ),
          SmoothPageIndicator(
              controller: controller.pageController, // PageController
              count: itemWidget.length,
          effect: const ExpandingDotsEffect(),)
        ],
      ),
    );
  }

  Widget widgetBestSeller() {
    List<Widget> itemWidget = [];
    for (BestsellerListElement itemData
        in controller.homeResponse.value.data?.bestSeller?.bestsellerList ??
            []) {
      itemWidget.add(SizedBox(
        width: size_150,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getNetworkImage(itemData.image ?? "", size_150, size_250),
            Text(
              lblAvailable.toUpperCase(),
              style: AppText.textRegular
                  .copyWith(color: Colors.grey, fontSize: font_16),
            ).marginOnly(top: size_5),
            Text(
              itemData.name ?? "N/A",
              style: AppText.textBold
                  .copyWith(color: colorBlack, fontSize: font_18),
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ).marginOnly(top: size_3),
            Text(
              "${itemData.currencyCode ?? ""} ${itemData.price ?? "0.0"}",
              style: AppText.textBold
                  .copyWith(color: colorPink, fontSize: font_16),
            ).marginOnly(top: size_12),
          ],
        ),
      ).marginOnly(right: size_10));
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(size_15),
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
          padding: const EdgeInsets.all(size_15),
          decoration: const BoxDecoration(color: colorLightGrey),
          child: Container(
            decoration: const BoxDecoration(
              color: colorWhite,
            ),
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(
                  left: size_10, top: size_10, bottom: size_10),
              scrollDirection: Axis.horizontal,
              child: Row(children: itemWidget),
            ),
          ),
        )
      ],
    );
  }

  Widget widgetOfferItemBanner() {
    List<Widget> itemWidget = [];
    List<OfferItemsBanner> copyList =
        controller.homeResponse.value.data?.offerItemsBanner ?? [];
    for (OfferItemsBanner banner in copyList) {
      itemWidget.add(ClipRRect(
        borderRadius: BorderRadius.circular(size_10),
        child: getNetworkImage(banner.bannerImage ?? "",
            (MediaQuery.of(Get.context!).size.width - size_40), size_150),
      ).marginOnly(
          right: copyList.indexOf(banner) == (copyList.length - 1)
              ? size_0
              : size_20));
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.all(size_20),
      child: Row(
        children: itemWidget,
      ),
    );
  }

  Widget widgetSeeMoreCategories() {
    return Container(
      margin: const EdgeInsets.only(top: size_10, bottom: size_20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            lblSeeMoreCategories,
            textAlign: TextAlign.left,
            style:
                AppText.textBold.copyWith(color: colorBlack, fontSize: font_18),
          ).paddingOnly(left: size_20),
          itemWidgetSeeMoreCategories()
        ],
      ),
    );
  }

  Widget itemWidgetSeeMoreCategories() {
    List<Widget> itemWidget = [];
    List<SeeMoreCategory> copyList =
        controller.homeResponse.value.data?.seeMoreCategories ?? [];
    for (SeeMoreCategory category in copyList) {
      itemWidget.add(Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: size_85,
              height: size_85,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      width: size_80,
                      height: size_80,
                      decoration: BoxDecoration(
                          color: colorLightGrey,
                          borderRadius: BorderRadius.circular(size_40),
                          border: Border.all(color: colorPink, width: size_1)),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(size_40),
                    child:
                        getNetworkImage(category.image ?? "", size_80, size_80),
                  )
                ],
              ),
            ),
            Container(
              width: size_90,
              child: Text(
                category.name ?? "N/A",
                maxLines: 2,
                softWrap: true,
                textAlign: TextAlign.center,
                style: AppText.textRegular
                    .copyWith(color: colorBlack, fontSize: font_16),
              ).marginOnly(top: size_10),
            )
          ],
        ).marginOnly(right: size_20),
      ));
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(top: size_20, left: size_20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: itemWidget,
      ),
    );
  }

  Widget widgetProductWithCategory() {
    List<Widget> itemWidget = [];
    for (BestsellerListElement itemData
        in controller.homeResponse.value.data?.muumyMeCategory?.list ?? []) {
      itemWidget.add(SizedBox(
        width: size_150,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getNetworkImage(itemData.image ?? "", size_150, size_250),
            Text(
              lblAvailable.toUpperCase(),
              style: AppText.textRegular
                  .copyWith(color: Colors.grey, fontSize: font_16),
            ).marginOnly(top: size_5),
            Text(
              itemData.name ?? "N/A",
              style: AppText.textBold
                  .copyWith(color: colorBlack, fontSize: font_18),
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ).marginOnly(top: size_3),
            Text(
              "${itemData.currencyCode ?? ""} ${itemData.price ?? "0.0"}",
              style: AppText.textBold
                  .copyWith(color: colorPink, fontSize: font_16),
            ).marginOnly(top: size_12),
          ],
        ),
      ).marginOnly(right: size_10));
    }

    return Container(
      decoration: const BoxDecoration(color: colorLightGrey),
      padding: const EdgeInsets.all(size_20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  child: Text(
                controller.homeResponse.value.data?.muumyMeCategory
                        ?.categoryName ??
                    "N/A",
                style: AppText.textBold
                    .copyWith(color: colorBlack, fontSize: font_18),
              )),
              Text(lblSeeAll,
                  style: AppText.textRegular
                      .copyWith(color: colorPink, fontSize: font_16))
            ],
          ),
          Container(
            decoration: const BoxDecoration(
              color: colorWhite,
            ),
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(
                  left: size_10, top: size_10, bottom: size_10),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: itemWidget,
              ),
            ),
          ).marginOnly(top: size_20),
        ],
      ),
    );
  }

  Widget widgetShopByBrands() {
    List<Widget> itemWidget = [];
    for (ShopByBrand brand
        in controller.homeResponse.value.data?.shopByBrand ?? []) {
      itemWidget.add(
        Container(
          width: size_100,
          height: size_100,
          child: Stack(
            children: [
              Image.asset(
                bgBrandHome,
                width: size_100,
                height: size_100,
                fit: BoxFit.fill,
              ),
              Align(
                  alignment: Alignment.center,
                  child: getNetworkImage(brand.image ?? "", size_60, size_60,
                      fit: BoxFit.contain)),
            ],
          ),
        ).marginOnly(right: size_20),
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          lblShopByBrand,
          textAlign: TextAlign.left,
          style:
              AppText.textBold.copyWith(color: colorBlack, fontSize: font_18),
        ).paddingOnly(left: size_20),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.only(top: size_20, left: size_20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: itemWidget,
          ),
        )
      ],
    ).marginSymmetric(vertical: size_20);
  }
}
