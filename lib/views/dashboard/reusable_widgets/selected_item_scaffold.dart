import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controllers/dash_controller.dart';
import '../../../widgets/exports.dart';

class SelectedItemScaffold extends StatelessWidget {
  const SelectedItemScaffold({
    Key? key,
    required this.description,
    required this.imgUrl,
    required this.title,
    required this.price,
    required this.ctrl,
    required this.prodId,
    this.addToCart,
  }) : super(key: key);
  final String imgUrl;
  final String title;
  final String description;
  final String price;
  final DashCtrl ctrl;
  final dynamic prodId;
  final Function()? addToCart;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Stack(
            children: [
              Positioned.fill(
                child: Image(
                  image: NetworkImage(imgUrl),
                  fit: BoxFit.fitWidth,
                  height: 90.0.h,
                ),
              ),
              IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.cancel,
                  size: 30,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
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
                style: GoogleFonts.inter(fontSize: 18.0.sp, height: 32 / 24),
              ),
              Gap(10.0.h),
              Text(
                description,
                textAlign: TextAlign.justify,
                style: GoogleFonts.inter(fontSize: 12.0.sp, height: 18 / 12),
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
              Obx(
                () => QuantityButton(
                  itemCount: ctrl.quantity.value.toString(),
                  addItem: () => ctrl.addQuantity(context),
                  removeItem: () => ctrl.reduceQuantity(),
                ),
              ),
              Gap(120.0.h),
              AppButton(
                title: 'Add to cart',
                icon: Icons.shopping_cart,
                onClick: addToCart,
              ),
              Gap(33.0.h),
            ],
          ),
        ),
      ],
    );
  }
}
