import 'package:ecommerce_app/core/services/api/store_api/store_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';
import 'package:get/utils.dart';

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
}
