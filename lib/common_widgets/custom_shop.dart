// import 'dart:developer';

// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get_utils/get_utils.dart';

// import '../../../../constants/text_font_style.dart';
// import '../../../../gen/colors.gen.dart';
// import '../../../../helpers/all_routes.dart';
// import '../../../../helpers/animation_helper.dart';
// import '../../../../helpers/navigation_service.dart';
// import '../../../../helpers/toast.dart';
// import '../../../../networks/exception_handler/error_response.dart';

// class CustomeShopWidget extends StatefulWidget {
//   final Map restaurant;
//   final bool showBottomDesign;
//   const CustomeShopWidget({
//     super.key,
//     this.showBottomDesign = true,
//     required this.restaurant,
//   });

//   @override
//   State<CustomeShopWidget> createState() => _CustomeShopWidgetState();
// }

// class _CustomeShopWidgetState extends State<CustomeShopWidget> {
//   bool isTapped = false;
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () async {
//         try {
//           if (widget.restaurant["is_closed"] == 1 &&
//               widget.restaurant["receiving_order"] == 0) {
//             ToastUtil.showLongToast("This shop is closed now!");
//             return;
//           }
//           // getShopDetailsRxObj.clean();
//           // getShopProductsRxObj.clean();
//           // getShopDetailsRxObj.fetchShopDetailsData(widget.restaurant["slug"]);
//           // getShopProductsRxObj.fetchShopProductsData(widget.restaurant["slug"]);
//           NavigationService.navigateTo(Routes.restauRantDetail);
//         } catch (error) {
//           log(error.toString());
//           ToastUtil.showShortToast(ResponseMessage.DEFAULT.tr);
//         }
//       },
//       child: Padding(
//         padding: EdgeInsets.only(bottom: 0.sp),
//         child: Card(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(15.r),
//                 topRight: Radius.circular(15.r)),
//           ),
//           elevation: 0,
//           margin: const EdgeInsets.all(0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Stack(
//                 children: <Widget>[
//                   ClipRRect(
//                     borderRadius: widget.showBottomDesign
//                         ? BorderRadius.all(
//                             Radius.circular(15.r),
//                           )
//                         : BorderRadius.only(
//                             topLeft: Radius.circular(15.r),
//                             topRight: Radius.circular(15.r),
//                           ),
//                     child: CachedNetworkImage(
//                       imageUrl: widget.restaurant["image_full_path"],
//                       height: 137.sp,
//                       width: double.infinity,
//                       fit: BoxFit.cover,
//                       placeholder: (context, url) => imageSimmerCached(137.sp),
//                       errorWidget: (context, url, error) =>
//                           imageNotFound(137.sp),
//                     ),
//                   ),
//                   if (widget.restaurant["rating"] == 0.0)
//                     Positioned(
//                       top: 8.sp,
//                       left: 8.sp,
//                       child: Container(
//                           height: 23.sp,
//                           width: 47.sp,
//                           decoration: BoxDecoration(
//                               color: AppColors.allPrimaryColor,
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(11.5.r))),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Icon(
//                                 Icons.star_border,
//                                 size: 15.sp,
//                                 color: AppColors.cFEFFFE,
//                               ),
//                               //UIHelper.horizontalSpaceSmall,

//                               Text(widget.restaurant["rating"],
//                                   style: TextFontStyle.headline12StyleMontserrat
//                                       .copyWith(fontWeight: FontWeight.w600))
//                             ],
//                           )),
//                     ),
//                   if (widget.restaurant["is_favourite"] == 0 && !isTapped)
//                     Positioned(
//                       top: 8.sp,
//                       right: 8.sp,
//                       child: InkWell(
//                         onTap: () async {
//                           // try {
//                           //   if (!appData.read(kKeyIsExploring)) {
//                           //     await postFavouriteShopRXObj
//                           //         .postFavouriteShopData({
//                           //       'restaurant_id': widget.restaurant["id"]
//                           //     }).waitingForFutureWithoutBg();
//                           //     setState(() {
//                           //       isTapped = true;
//                           //     });
//                           //   } else {
//                           //     ToastUtil.showNotLoggedInToast();
//                           //   }
//                           // } catch (error) {
//                           //   log(error.toString());
//                           //   ToastUtil.showShortToast(
//                           //       ResponseMessage.DEFAULT.tr);
//                           // }
//                         },
//                         child: const Icon(Icons.favorite_border,
//                             color: AppColors.cFEFFFE),
//                       ),
//                     ),
//                   if (isTapped || widget.restaurant["is_favourite"] == 1)
//                     Positioned(
//                       top: 8.sp,
//                       right: 8.sp,
//                       child: InkWell(
//                         onTap: () async {
//                           // try {
//                           //   await postFavouriteShopRXObj.postFavouriteShopData({
//                           //     'restaurant_id': widget.restaurant["id"]
//                           //   }).waitingForFutureWithoutBg();
//                           //   setState(() {
//                           //     isTapped = false;
//                           //   });
//                           // } catch (error) {
//                           //   log(error.toString());
//                           //   ToastUtil.showShortToast(
//                           //       ResponseMessage.DEFAULT.tr);
//                           // }
//                         },
//                         child: const Icon(
//                           Icons.favorite,
//                           color: AppColors.allPrimaryColor,
//                         ),
//                       ),
//                     ),
//                   if (widget.restaurant["is_closed"] == 1 &&
//                       widget.restaurant["receiving_order"] == 1)
//                     Positioned(
//                       bottom: 20,
//                       right: 10,
//                       child: Container(
//                         constraints:
//                             BoxConstraints(minHeight: 20.sp, minWidth: 100.sp),
//                         padding: EdgeInsets.all(5.sp),
//                         decoration: BoxDecoration(
//                             color: AppColors.allPrimaryColor,
//                             borderRadius:
//                                 BorderRadius.all(Radius.circular(5.r))),
//                         child: Center(
//                           child: Text("ORDER FOR LATER".tr,
//                               // textAlign: TextAlign.center,
//                               style: TextFontStyle.headline12StyleMontserrat
//                                   .copyWith(
//                                 color: AppColors.cFEFFFE,
//                                 fontWeight: FontWeight.bold,
//                                 // overflow: TextOverflow.fade,
//                               )),
//                         ),
//                       ),
//                     ),
//                   if (widget.restaurant["is_closed"] == 0 &&
//                       widget.restaurant["receiving_order"] == 1)
//                     Positioned(
//                       bottom: 20,
//                       right: 10,
//                       child: Container(
//                         constraints:
//                             BoxConstraints(minHeight: 20.sp, minWidth: 100.sp),
//                         padding: EdgeInsets.all(5.sp),
//                         decoration: BoxDecoration(
//                             color: AppColors.c47B54C,
//                             borderRadius:
//                                 BorderRadius.all(Radius.circular(5.r))),
//                         child: Center(
//                           child: Text("OPEN NOW".tr,
//                               style: TextFontStyle.headline12StyleMontserrat
//                                   .copyWith(
//                                 color: AppColors.cFEFFFE,
//                                 fontWeight: FontWeight.bold,
//                                 // overflow: TextOverflow.fade,
//                               )),
//                         ),
//                       ),
//                     ),
//                   if (widget.restaurant["is_closed"] == 1 &&
//                       widget.restaurant["receiving_order"] == 0)
//                     Positioned(
//                       bottom: 20,
//                       right: 10,
//                       child: Container(
//                         constraints:
//                             BoxConstraints(minHeight: 20.sp, minWidth: 100.sp),
//                         padding: EdgeInsets.all(5.sp),
//                         decoration: BoxDecoration(
//                             color: AppColors.cFF0000,
//                             borderRadius:
//                                 BorderRadius.all(Radius.circular(5.r))),
//                         child: Center(
//                           child: Text("Closed".tr,
//                               style: TextFontStyle.headline12StyleMontserrat
//                                   .copyWith(
//                                 color: AppColors.cFEFFFE,
//                                 fontWeight: FontWeight.bold,
//                                 // overflow: TextOverflow.fade,
//                               )),
//                         ),
//                       ),
//                     ),
//                 ],
//               ),
//               Container(
//                 padding: EdgeInsets.only(top: 10.r, bottom: 15.r),
//                 decoration: BoxDecoration(
//                     color: widget.showBottomDesign
//                         ? Colors.transparent
//                         : AppColors.cF4F4F4,
//                     borderRadius: BorderRadius.only(
//                         bottomLeft: Radius.circular(8.r),
//                         bottomRight: Radius.circular(8.r))),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     widget.showBottomDesign
//                         ? Text(
//                             widget.restaurant["name"] +
//                                 " " +
//                                 "(${widget.restaurant["category_name"]})",
//                             style: TextFontStyle.headline16StyleMontserrat500
//                                 .copyWith(color: AppColors.c0A0909))
//                         : Center(
//                             child: Text(widget.restaurant["name"],
//                                 style: TextFontStyle
//                                     .headline16StyleMontserrat500
//                                     .copyWith(color: AppColors.c0A0909)),
//                           ),
//                     if (widget.showBottomDesign)
//                       Text(
//                         widget.restaurant["bag_fee"],
//                         style: TextFontStyle.headline12StyleMontserrat.copyWith(
//                             color: AppColors.c969696,
//                             fontWeight: FontWeight.w400),
//                       ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
