import 'package:ecommerce_app/core/services/api/store_api/store_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../views/dashboard/reusable_widgets/selected_item_scaffold.dart';

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

  moreDetails(BuildContext context, String imgUrl, String title,
      String description, String price, DashCtrl ctrl, dynamic prodId) {
    showBottomSheet(
      enableDrag: false,
      elevation: 30.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(23.0.r),
          topRight: Radius.circular(23.0.r),
        ),
      ),
      context: context,
      builder: (context) {
        return SelectedItemScaffold(
          description: description,
          price: price,
          imgUrl: imgUrl,
          title: title,
          ctrl: ctrl,
          prodId: prodId,
          addToCart: () async {
            await ctrl.storeService
                .addProduct(prodId.toString(), ctrl.quantity.value.toString());
            ctrl.resetQuantity();

            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Item added to cart successfully!'),
              ),
            );
            Get.back();
          },
        );
      },
    );
  }
}
