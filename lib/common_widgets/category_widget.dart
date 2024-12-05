// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:provider/provider.dart';
// import '/helpers/di.dart';
// import '/networks/api_acess.dart';
// import '../constants/app_constants.dart';
// import '../helpers/all_routes.dart';
// import '../helpers/animation_helper.dart';
// import '../helpers/navigation_service.dart';
// import '../provider/provides.dart';
// import '../../../../gen/colors.gen.dart';
// import '/constants/text_font_style.dart';
// import '/helpers/ui_helpers.dart';

// final class CategoryWidget extends StatelessWidget {
//   final Map? item;
//   final bool? imageSwitch;
//   final bool? isCategory;
//   final bool? isSelected;
//   final bool? isRoute;

//   const CategoryWidget({
//     super.key,
//     required this.item,
//     this.imageSwitch = true,
//     this.isCategory = true,
//     this.isSelected = false,
//     this.isRoute = false,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//         onTap: () async {
//           double clat = appData.read(kKeySelectedLat);
//           double clng = appData.read(kKeySelectedLng);
//           if (isCategory!) {
//             getSubCategoryByCategoryRXObj.clean();
//             getShopByCategoriesRXObj.clean();
//             getSubCategoryByCategoryRXObj.fetchSubCategoryByCategoryData(item!["slug"]);
//             getShopByCategoriesRXObj.fetchShopByCategoriesData(item!["slug"], clat, clng);
//             context.read<SelectedSubCat>().selectedSubCatIDClear();
//             NavigationService.navigateTo(Routes.shopByCategories);
//           } else {
//             context.read<SelectedSubCat>().subCatID = item!["id"];
//             postShopBySubCategoryRXObj.clean();
//             postShopBySubCategoryRXObj.postShopBySubCategory(item!["id"]);
//             if (isRoute!) {
//               NavigationService.navigateTo(Routes.shopByCategories);
//             }
//           }
//         },
//         child: Container(
//           decoration: BoxDecoration(
//               color: AppColors.cF4F4F4,
//               border: Border.all(
//                   color: context.watch<SelectedSubCat>().id != null
//                       ? context.watch<SelectedSubCat>().id == item!["id"]
//                           ? AppColors.allPrimaryColor
//                           : Colors.transparent
//                       : Colors.transparent),
//               borderRadius: BorderRadius.all(Radius.circular(28.r))),
//           child: Row(children: [
//             imageSwitch!
//                 ? ClipRRect(
//                     borderRadius: BorderRadius.circular(25.r),
//                     child: CachedNetworkImage(
//                       imageUrl: item!["image_full_path"],
//                       height: 60.sp,
//                       width: 60.sp,
//                       placeholder: (context, url) => imageSimmerCached(60.sp),
//                       errorWidget: (context, url, error) => imageNotFound(60.sp),
//                     ),
//                   )
//                 : CircleAvatar(
//                     radius: 25.r,
//                     backgroundImage: NetworkImage(
//                       item!["image_full_path"],
//                     ),
//                   ),
//             UIHelper.horizontalSpaceSmall,
//             SizedBox(
//               width: .2.sw,
//               child: Text(
//                 item!["name"],
//                 style: TextFontStyle.headline11StyleMontserrat.copyWith(
//                   color: AppColors.c0A0909,
//                 ),
//                 overflow: TextOverflow.clip,
//               ),
//             ),
//             UIHelper.horizontalSpaceSmall,
//           ]),
//         ));
//   }
// }
