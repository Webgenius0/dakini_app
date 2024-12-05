// import 'package:badges/badges.dart' as badges;
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../gen/colors.gen.dart';
// import '../networks/api_acess.dart';
// import '../provider/provides.dart';
// import 'icon_holder_widget.dart';

// final class CartIcon extends StatelessWidget {
//   const CartIcon({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//       stream: getCartRXObj.getCartData,
//       builder: (context, snapshot) {
//         if (snapshot.hasData &&  snapshot.data != null && snapshot.data["data"] != null) {
//           Map data = snapshot.data["data"];
//           List carts = data["carts"];
//           //its required for cheking cark data when the cart is empty we are not showing empty cart but history data
//           Future.delayed(const Duration(seconds: 1))
//               .then((value) => Provider.of<CartCounter>(context, listen: false).setShowCart = carts.length);
//           return badges.Badge(
//             position: badges.BadgePosition.topEnd(top: -8, end: -5),
//             showBadge: carts.isNotEmpty ? true : false,
//             badgeAnimation: const badges.BadgeAnimation.rotation(
//               animationDuration: Duration(seconds: 1),
//               colorChangeAnimationDuration: Duration(seconds: 1),
//               loopAnimation: false,
//               curve: Curves.fastOutSlowIn,
//               colorChangeAnimationCurve: Curves.easeInCubic,
//             ),
//             badgeContent: Text(
//               carts.length.toString(),
//               style: const TextStyle(
//                 color: Colors.white,
//               ),
//             ),
//             child: const IconHolder(
//                 icon: Icons.shopping_cart_outlined, iconColor: AppColors.c000000, bgColor: AppColors.cF4F4F4),
//           );
//         } else if (snapshot.hasError) {
//           return const SizedBox.shrink();
//         }
//         return const SizedBox.shrink();
//       },
//     );
//   }
// }
