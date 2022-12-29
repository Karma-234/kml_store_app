import 'package:ecommerce_app/core/exports.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../views/dashboard/reusable_widgets/selected_item_scaffold.dart';

class DashCtrl extends GetxController {
  static DashCtrl get find => Get.find();
  final storeService = StoreApi();
  ProductModel productModel = ProductModel();
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

  moreDetails(BuildContext context, DashCtrl ctrl, ProductModel productModel) {
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
          description: productModel.description!,
          price: productModel.price!,
          imgUrl: productModel.imgUrl!,
          title: productModel.title!,
          ctrl: ctrl,
          prodId: productModel.id!,
          addToCart: () async {
            productModel.quantity = ctrl.quantity.value.toString();
            await ctrl.storeService
                .addProduct(productModel)
                .then((value) => ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Item added to cart successfully!'),
                      ),
                    ));

            ctrl.resetQuantity();
            Get.back();
          },
        );
      },
    );
  }
}
