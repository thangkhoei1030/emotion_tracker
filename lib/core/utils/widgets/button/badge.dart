import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class BadgeWidget extends StatelessWidget {
  const BadgeWidget({super.key, required this.numberCart});

  final int numberCart;

  @override
  Widget build(BuildContext context) {
    return badges.Badge(
      position: badges.BadgePosition.bottomStart(
        bottom: 20,
        start: 22,
      ),
      showBadge: true,
      ignorePointer: false,
      badgeContent: Text(
        numberCart.toString(),
        style: Get.textTheme.bodySmall!
            .copyWith(fontSize: 10, color: Colors.white),
      ),
      badgeAnimation: const badges.BadgeAnimation.fade(
        animationDuration: Duration(seconds: 1),
        colorChangeAnimationDuration: Duration(seconds: 1),
        loopAnimation: false,
        curve: Curves.fastOutSlowIn,
        colorChangeAnimationCurve: Curves.easeInCubic,
      ),
      badgeStyle: badges.BadgeStyle(
        shape: badges.BadgeShape.circle,
        badgeColor: Colors.red,
        borderRadius: BorderRadius.circular(50),
      ),
      child: IconButton(
        splashColor: Colors.transparent,
        onPressed: () {
          ///TODO:BADGE ROUTES
          // Get.toNamed(AppRoutes.cartPage);
        },
        icon: const Icon(
          Iconsax.shopping_bag,
          // color: AppColors.iconColors,
        ),
      ),
    );
  }
}
