import 'package:ecommerce_app/core/services/api/store_api/store_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';
import 'package:get/utils.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/exports.dart';

class DashCtrl extends GetxController {
  static DashCtrl get find => Get.find();
  final storeService = StoreApi();
  RxInt index = 0.obs;
  RxInt quantity = 1.obs;
  setInt(int newIndex) {
    index.value = newIndex;
  }

  addQuantity(BuildContext context) {
    if (quantity.value < 10) {
      quantity.value++;
    } else {
      return GetPlatform.isIOS
          ? showCupertinoModalPopup(
              context: context,
              builder: (context) {
                return const CupertinoActionSheet(
                  title: Text('Max Cart Items'),
                );
              },
            )
          : ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('You cannot add anymore items'),
              ),
            );
    }
  }

  reduceQuantity() {
    if (quantity.value > 1) {
      quantity.value--;
    }
  }

  resetQuantity() {
    quantity.value = 1;
  }

  moreDetails(
    BuildContext context,
    String imgUrl,
    String title,
    String description,
    String price,
    DashCtrl ctrl,
    dynamic prodId,
  ) {
    showBottomSheet(
      enableDrag: true,
      elevation: 30.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(23.0.r),
          topRight: Radius.circular(23.0.r),
        ),
      ),
      context: context,
      builder: (context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image(
              image: NetworkImage(imgUrl),
              fit: BoxFit.fitWidth,
              height: 90.0.h,
            ),
            Gap(15.0.h),
            Padding(
              padding: EdgeInsets.only(left: 23.0.w, right: 23.0.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.justify,
                    style:
                        GoogleFonts.inter(fontSize: 18.0.sp, height: 32 / 24),
                  ),
                  Gap(10.0.h),
                  Text(
                    description,
                    textAlign: TextAlign.justify,
                    style:
                        GoogleFonts.inter(fontSize: 12.0.sp, height: 18 / 12),
                  ),
                  Gap(10.0.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        price,
                        style: GoogleFonts.inter(fontSize: 23.0),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      CounterButton(
                        icon: Icons.add,
                        onPressd: () {
                          ctrl.addQuantity(context);
                        },
                      ),
                      Gap(10.0.w),
                      Obx(
                        () => Text(
                          ctrl.quantity.value.toString(),
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.inter(
                              fontSize: 14.0.sp, height: 21 / 14),
                        ),
                      ),
                      Gap(10.0.w),
                      CounterButton(
                        icon: FontAwesomeIcons.minus,
                        onPressd: () {
                          ctrl.reduceQuantity();
                        },
                      ),
                    ],
                  ),
                  Gap(120.0.h),
                  ElevatedButton(
                    onPressed: () async {
                      ctrl.storeService
                          .addProduct(
                              prodId.toString(), ctrl.quantity.value.toString())
                          .then((value) {
                        ctrl.resetQuantity();
                        Get.back();
                      });
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('Add to cart'),
                      ],
                    ),
                  ),
                  Gap(15.0.h),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
