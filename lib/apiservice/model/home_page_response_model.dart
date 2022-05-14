// To parse this JSON data, do
//
//     final homePageResponseModel = homePageResponseModelFromJson(jsonString);

import 'dart:convert';

List<HomePageResponseModel> homePageResponseModelFromJson(String str) =>
    List<HomePageResponseModel>.from(
        json.decode(str).map((x) => HomePageResponseModel.fromJson(x)));

String homePageResponseModelToJson(List<HomePageResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HomePageResponseModel {
  HomePageResponseModel({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  Data? data;

  factory HomePageResponseModel.fromJson(Map<String, dynamic> json) =>
      HomePageResponseModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null ? null : data!.toJson(),
      };
}

class Data {
  Data({
    required this.bannerSlider,
    required this.bestSeller,
    required this.muumyMeCategory,
    required this.seeMoreCategories,
    required this.shopByBrand,
    required this.offerItemsBanner,
  });

  List<BannerSlider>? bannerSlider;
  BestSeller? bestSeller;
  MuumyMeCategory? muumyMeCategory;
  List<SeeMoreCategory>? seeMoreCategories;
  List<ShopByBrand>? shopByBrand;
  List<OfferItemsBanner>? offerItemsBanner;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        bannerSlider: List<BannerSlider>.from(
            json["banner_slider"].map((x) => BannerSlider.fromJson(x))),
        bestSeller: BestSeller.fromJson(json["best_seller"]),
        muumyMeCategory: MuumyMeCategory.fromJson(json["muumy_me_category"]),
        seeMoreCategories: List<SeeMoreCategory>.from(
            json["see_more_categories"]
                .map((x) => SeeMoreCategory.fromJson(x))),
        shopByBrand: List<ShopByBrand>.from(
            json["shop_by_brand"].map((x) => ShopByBrand.fromJson(x))),
        offerItemsBanner: List<OfferItemsBanner>.from(json["offer_items_banner"]
            .map((x) => OfferItemsBanner.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "banner_slider": bannerSlider == null
            ? []
            : List<dynamic>.from(bannerSlider!.map((x) => x.toJson())),
        "best_seller": bannerSlider == null ? null : bestSeller!.toJson(),
        "muumy_me_category":
            muumyMeCategory == null ? null : muumyMeCategory!.toJson(),
        "see_more_categories": seeMoreCategories == null
            ? null
            : List<dynamic>.from(seeMoreCategories!.map((x) => x.toJson())),
        "shop_by_brand": shopByBrand == null
            ? null
            : List<dynamic>.from(shopByBrand!.map((x) => x.toJson())),
        "offer_items_banner": offerItemsBanner == null
            ? null
            : List<dynamic>.from(offerItemsBanner!.map((x) => x.toJson())),
      };
}

class BannerSlider {
  BannerSlider({
    required this.slideId,
    required this.sliderId,
    required this.storeId,
    required this.title,
    required this.mobileImage,
    required this.link,
    required this.categoryId,
    required this.order,
  });

  String? slideId;
  String? sliderId;
  String? storeId;
  String? title;
  String? mobileImage;
  String? link;
  String? categoryId;
  String? order;

  factory BannerSlider.fromJson(Map<String, dynamic> json) => BannerSlider(
        slideId: json["slide_id"],
        sliderId: json["slider_id"],
        storeId: json["store_id"],
        title: json["title"],
        mobileImage: json["mobile_image"],
        link: json["link"] ?? "",
        categoryId: json["category_id"],
        order: json["order"],
      );

  Map<String, dynamic> toJson() => {
        "slide_id": slideId,
        "slider_id": sliderId,
        "store_id": storeId,
        "title": title,
        "mobile_image": mobileImage,
        "link": link,
        "category_id": categoryId,
        "order": order,
      };
}

class BestSeller {
  BestSeller({
    required this.id,
    required this.bestsellerList,
  });

  String? id;
  List<BestsellerListElement>? bestsellerList;

  factory BestSeller.fromJson(Map<String, dynamic> json) => BestSeller(
        id: json["id"],
        bestsellerList: List<BestsellerListElement>.from(json["bestseller_list"]
            .map((x) => BestsellerListElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "bestseller_list": bestsellerList == null
            ? null
            : List<dynamic>.from(bestsellerList!.map((x) => x.toJson())),
      };
}

class BestsellerListElement {
  BestsellerListElement({
    required this.productId,
    required this.sku,
    required this.mgsBrand,
    required this.name,
    required this.url,
    required this.image,
    required this.price,
    required this.specialPrice,
    required this.finalPrice,
    required this.discount,
    required this.currencyCode,
    required this.isWishlisted,
    required this.wishlistItemId,
    required this.wishlistId,
    required this.entityId,
    required this.productLabel,
  });

  String? productId;
  String? sku;
  String? mgsBrand;
  String? name;
  String? url;
  String? image;
  String? price;
  String? specialPrice;
  String? finalPrice;
  String? discount;
  String? currencyCode;
  int? isWishlisted;
  String? wishlistItemId;
  String? wishlistId;
  String? entityId;
  String? productLabel;

  factory BestsellerListElement.fromJson(Map<String, dynamic> json) =>
      BestsellerListElement(
        productId: json["product_id"],
        sku: json["sku"],
        mgsBrand: json["mgs_brand"],
        name: json["name"],
        url: json["url"] ?? "",
        image: json["image"],
        price: json["price"],
        specialPrice: json["special_price"],
        finalPrice: json["final_price"],
        discount: json["discount"] ?? "",
        currencyCode: json["currency_code"],
        isWishlisted: json["is_wishlisted"],
        wishlistItemId: json["wishlist_item_id"],
        wishlistId: json["wishlist_id"],
        entityId: json["entity_id"].toString(),
        productLabel: json["product_label"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "sku": sku,
        "mgs_brand": mgsBrand,
        "name": name,
        "url": url,
        "image": image,
        "price": price,
        "special_price": specialPrice,
        "final_price": finalPrice,
        "discount": discount,
        "currency_code": currencyCode,
        "is_wishlisted": isWishlisted,
        "wishlist_item_id": wishlistItemId,
        "wishlist_id": wishlistId,
        "entity_id": entityId,
        "product_label": productLabel,
      };
}

class MuumyMeCategory {
  MuumyMeCategory({
    required this.categoryId,
    required this.categoryName,
    required this.list,
  });

  String? categoryId;
  String? categoryName;
  List<BestsellerListElement>? list;

  factory MuumyMeCategory.fromJson(Map<String, dynamic> json) =>
      MuumyMeCategory(
        categoryId: json["category_id"],
        categoryName: json["category_name"],
        list: List<BestsellerListElement>.from(
            json["list"].map((x) => BestsellerListElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "category_id": categoryId,
        "category_name": categoryName,
        "list": list == null
            ? null
            : List<dynamic>.from(list!.map((x) => x.toJson())),
      };
}

class OfferItemsBanner {
  OfferItemsBanner({
    required this.categoryId,
    required this.bannerImage,
  });

  String? categoryId;
  String? bannerImage;

  factory OfferItemsBanner.fromJson(Map<String, dynamic> json) =>
      OfferItemsBanner(
        categoryId: json["category_id"],
        bannerImage: json["banner_image"],
      );

  Map<String, dynamic> toJson() => {
        "category_id": categoryId,
        "banner_image": bannerImage,
      };
}

class SeeMoreCategory {
  SeeMoreCategory({
    required this.name,
    required this.image,
    required this.entityId,
    required this.attributeSetId,
    required this.isActive,
    required this.parentId,
    required this.url,
    required this.childrenCount,
  });

  String? name;
  String? image;
  String? entityId;
  String? attributeSetId;
  String? isActive;
  String? parentId;
  String? url;
  String? childrenCount;

  factory SeeMoreCategory.fromJson(Map<String, dynamic> json) =>
      SeeMoreCategory(
        name: json["name"],
        image: json["image"],
        entityId: json["entity_id"],
        attributeSetId: json["attribute_set_id"],
        isActive: json["is_active"],
        parentId: json["parent_id"],
        url: json["url"],
        childrenCount: json["children_count"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
        "entity_id": entityId,
        "attribute_set_id": attributeSetId,
        "is_active": isActive,
        "parent_id": parentId,
        "url": url,
        "children_count": childrenCount,
      };
}

class ShopByBrand {
  ShopByBrand({
    required this.brandId,
    required this.label,
    required this.urlKey,
    required this.optionId,
    required this.image,
  });

  String? brandId;
  String? label;
  String? urlKey;
  String? optionId;
  String? image;

  factory ShopByBrand.fromJson(Map<String, dynamic> json) => ShopByBrand(
        brandId: json["brand_id"],
        label: json["label"],
        urlKey: json["url_key"],
        optionId: json["option_id"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "brand_id": brandId,
        "label": label,
        "url_key": urlKey,
        "option_id": optionId,
        "image": image,
      };
}
