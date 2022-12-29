import 'package:ecommerce_app/core/exports.dart';
import 'package:ecommerce_app/views/dashboard/dash_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartCtrl extends GetxController {
  static CartCtrl get find => Get.find();
  final storeAPi = StoreApi();

  clearCart(BuildContext context) async {
    await storeAPi.deletCart().then((value) {
      GetPlatform.isIOS
          ? showCupertinoDialog(
              context: context,
              builder: (context) => CupertinoAlertDialog(
                title: const Text('Cart'),
                content: const Text('Cart cleared Succesfully!'),
                actions: [
                  CupertinoDialogAction(
                    child: const Text('OK'),
                    onPressed: () => Get.off(DashView()),
                  )
                ],
              ),
            )
          : ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text('Cart cleared Succesfully'),
                action: SnackBarAction(
                  label: 'OK',
                  onPressed: () => Get.off(DashView()),
                ),
              ),
            );
    });
  }

  checkOut(BuildContext context) {
    GetPlatform.isIOS
        ? showCupertinoDialog(
            context: context,
            builder: (context) => CupertinoAlertDialog(
              title: const Text('Alert'),
              content: const Text('Purchase succesfull!'),
              actions: [
                CupertinoDialogAction(
                  child: const Text('OK'),
                  onPressed: () => Get.off(DashView()),
                )
              ],
            ),
          )
        : ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('Purchase successful!'),
              action: SnackBarAction(
                label: 'OK',
                onPressed: () => Get.off(DashView()),
              ),
            ),
          );
  }
}
