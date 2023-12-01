// class Product {
//   String? id,
//       name,
//       desc,
//       image,
//       catName,
//       type,
//       rating,
//       noOfRating,
//       attrIds,
//       tax,
//       categoryId,
//       shortDescription,
//       qtyStepSize;
//   List<String>? itemsCounter;
//   List<String>? otherImage;
//   List<Product_Varient>? prVarientList;
//   List<Attribute>? attributeList;
//   List<String>? selectedId = [];
//   List<String>? tagList = [];
//   int? minOrderQuntity;
//   String? isFav,
//       isReturnable,
//       isCancelable,
//       isPurchased,
//       availability,
//       madein,
//       indicator,
//       stockType,
//       cancleTill,
//       total,
//       banner,
//       totalAllow,
//       video,
//       videType,
//       warranty,
//       gurantee;
//   String? minPrice, maxPrice;
//   String? totalImg;
//   List<ReviewImg>? reviewList;
//
//   bool? isFavLoading = false, isFromProd = false;
//   int? offset, totalItem, selVarient;
//
//   List<Product>? subList;
//   List<Filter>? filterList;
//   bool? history = false;
//   String? store_description,
//       seller_rating,
//       seller_profile,
//       seller_name,
//       seller_id,
//       store_name,
//       estimated_time,
//       food_person,
//       open_close_status,
//       address,
//       coverImage;
//
//   // String historyList;
//
//   Product(
//       {this.id,
//         this.name,
//         this.desc,
//         this.image,
//         this.catName,
//         this.type,
//         this.otherImage,
//         this.prVarientList,
//         this.attributeList,
//         this.isFav,
//         this.isCancelable,
//         this.isReturnable,
//         this.isPurchased,
//         this.availability,
//         this.noOfRating,
//         this.attrIds,
//         this.selectedId,
//         this.rating,
//         this.isFavLoading,
//         this.indicator,
//         this.madein,
//         this.tax,
//         this.shortDescription,
//         this.total,
//         this.categoryId,
//         this.subList,
//         this.filterList,
//         this.stockType,
//         this.isFromProd,
//         this.cancleTill,
//         this.totalItem,
//         this.offset,
//         this.totalAllow,
//         this.banner,
//         this.selVarient,
//         this.video,
//         this.videType,
//         this.tagList,
//         this.warranty,
//         this.qtyStepSize,
//         this.minOrderQuntity,
//         this.itemsCounter,
//         this.reviewList,
//         this.history,
//         this.minPrice,
//         this.maxPrice,
//         //  this.historyList,
//         this.gurantee,
//         this.store_description,
//         this.seller_rating,
//         this.seller_profile,
//         this.seller_name,
//         this.seller_id,
//         this.store_name,
//         this.estimated_time,
//         this.food_person,
//         this.open_close_status,
//         this.address});
//
//   factory Product.fromJson(Map<String, dynamic> json) {
//     List<Product_Varient> varientList = (json[PRODUCT_VARIENT] as List)
//         .map((data) => new Product_Varient.fromJson(data))
//         .toList();
//
//     List<Attribute> attList = (json[ATTRIBUTES] as List)
//         .map((data) => new Attribute.fromJson(data))
//         .toList();
//
//     var flist = (json[FILTERS] as List?);
//     List<Filter> filterList = [];
//     if (flist == null || flist.isEmpty)
//       filterList = [];
//     else
//       filterList = flist.map((data) => new Filter.fromJson(data)).toList();
//
//     List<String> other_image = List<String>.from(json[OTHER_IMAGE]);
//     List<String> selected = [];
//
//     List<String> tags = List<String>.from(json[TAG]);
//
//     List<String> items = new List<String>.generate(
//         json[TOTALALOOW] != null ? int.parse(json[TOTALALOOW]) : 10, (i) {
//       return ((i + 1) * int.parse(json[QTYSTEP])).toString();
//     });
//
//     var reviewImg = (json[REV_IMG] as List?);
//     List<ReviewImg> reviewList = [];
//     if (reviewImg == null || reviewImg.isEmpty)
//       reviewList = [];
//     else
//       reviewList =
//           reviewImg.map((data) => new ReviewImg.fromJson(data)).toList();
//
//     return new Product(
//       id: json[ID],
//       name: json[NAME],
//       desc: json[DESC],
//       image: json[IMAGE],
//       catName: json[CAT_NAME],
//       rating: json[RATING],
//       noOfRating: json[NO_OF_RATE],
//       type: json[TYPE],
//       isFav: json[FAV].toString(),
//       isCancelable: json[ISCANCLEABLE],
//       availability: json[AVAILABILITY].toString(),
//       isPurchased: json[ISPURCHASED].toString(),
//       isReturnable: json[ISRETURNABLE],
//       otherImage: other_image,
//       prVarientList: varientList,
//       attributeList: attList,
//       filterList: filterList,
//       isFavLoading: false,
//       selVarient: 0,
//       attrIds: json[ATTR_VALUE],
//       madein: json[MADEIN],
//       shortDescription: json[SHORT],
//       indicator: json[INDICATOR].toString(),
//       stockType: json[STOCKTYPE].toString(),
//       tax: json[TAX_PER],
//       total: json[TOTAL],
//       categoryId: json[CATID],
//       selectedId: selected,
//       totalAllow: json[TOTALALOOW],
//       cancleTill: json[CANCLE_TILL],
//       video: json[VIDEO],
//       videType: json[VIDEO_TYPE],
//       tagList: tags,
//       itemsCounter: items,
//       warranty: json[WARRANTY],
//       minOrderQuntity: int.parse(json[MINORDERQTY]),
//       qtyStepSize: json[QTYSTEP],
//       gurantee: json[GAURANTEE],
//       reviewList: reviewList,
//       history: false,
//       minPrice: json[MINPRICE],
//       maxPrice: json[MAXPRICE],
//       seller_name: json[SELLER_NAME],
//       seller_profile: json[SELLER_PROFILE],
//       seller_rating: json[SELLER_RATING],
//       store_description: json[STORE_DESC],
//       store_name: json[STORE_NAME],
//       seller_id: json[SELLER_ID],
//       estimated_time: json["estimated_time"],
//       food_person: json["food_person"],
//       address: json["address"],
//       open_close_status: json["open_close_status"],
//
//       // totalImg: tImg,
//       // totalReviewImg: json[REV_IMG][TOTALIMGREVIEW],
//       // productRating: reviewList
//     );
//   }
//
//   factory Product.all(String name, String img, cat) {
//     return new Product(name: name, catName: cat, image: img, history: false);
//   }
//
//   factory Product.history(String history) {
//     return new Product(name: history, history: true);
//   }
//
//   factory Product.fromSeller(Map<String, dynamic> json) {
//     return new Product(
//       seller_name: json[SELLER_NAME],
//       seller_profile: json[SELLER_PROFILE],
//       seller_rating: json[SELLER_RATING],
//       store_description: json[STORE_DESC],
//       store_name: json[STORE_NAME],
//       seller_id: json[SELLER_ID],
//       estimated_time: json["estimated_time"],
//       food_person: json["food_person"],
//       address: json["address"],
//       open_close_status: json["open_close_status"],
//
//
//     );
//   }
//
//   factory Product.fromCat(Map<String, dynamic> parsedJson) {
//     return new Product(
//       id: parsedJson[ID],
//       name: parsedJson[NAME],
//       image: parsedJson[IMAGE],
//       banner: parsedJson[BANNER],
//       isFromProd: false,
//       offset: 0,
//       totalItem: 0,
//       tax: parsedJson[TAX],
//       subList: createSubList(parsedJson["children"]),
//     );
//   }
//
//   factory Product.popular(String name, String image) {
//     return new Product(name: name, image: image);
//   }
//
//   static List<Product>? createSubList(List? parsedJson) {
//     if (parsedJson == null || parsedJson.isEmpty) return null;
//
//     return parsedJson.map((data) => new Product.fromCat(data)).toList();
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'Color.dart';

final int timeOut = 50;
const int perPage = 10;

noIntText(BuildContext context) {
  return Container(
      child: Text('No Internet',
          style: Theme.of(context)
              .textTheme
              .headline5!
              .copyWith(color: colors.primary, fontWeight: FontWeight.normal),
      ),
  );
}

noIntImage() {
  return SvgPicture.asset(
    'assets/images/no_internet.svg',
    fit: BoxFit.contain,
    color: colors.primary,
  );
}

erroWidget(double size) {
  return Image.asset(
    'assets/images/placeholder.png',
    height: size,
    width: size,
  );
}


noIntDec(BuildContext context) {
  return Container(
    padding: EdgeInsetsDirectional.only(top: 30.0, start: 30.0, end: 30.0),
    child: Text("Please check your connection again, or connect to Wi-Fi",
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headline6!.copyWith(
          color: colors.black,
          fontWeight: FontWeight.normal,
        )),
  );
}

String? validateField(String value, String? msg) {
  if (value.length == 0)
    return msg;
  else
    return null;
}

String? validateEmail(String value, String? msg1, String? msg2) {
  if (value.length == 0) {
    return msg1;
  } else if (!RegExp(
      r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)"
      r"*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+"
      r"[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
      .hasMatch(value)) {
    return msg2;
  } else {
    return null;
  }
}

dialogAnimate(BuildContext context, Widget dialge) {
  return showGeneralDialog(
      barrierColor: colors.black,
      transitionBuilder: (context, a1, a2, widget) {
        return Transform.scale(
          scale: a1.value,
          child: Opacity(opacity: a1.value, child: dialge),
        );
      },
      transitionDuration: Duration(milliseconds: 200),
      barrierDismissible: true,
      barrierLabel: '',
      context: context,
      // pageBuilder: null
      pageBuilder: (context, animation1, animation2) {
        return Container();
      } //as Widget Function(BuildContext, Animation<double>, Animation<double>)
  );
}


