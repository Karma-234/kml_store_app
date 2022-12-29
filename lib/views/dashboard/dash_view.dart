import 'package:ecommerce_app/controllers/dash_controller.dart';
import 'package:ecommerce_app/views/cart/cart_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../widgets/exports.dart';

class DashView extends StatefulWidget {
  DashView({super.key});

  @override
  State<DashView> createState() => _DashViewState();
}

class _DashViewState extends State<DashView>
    with SingleTickerProviderStateMixin {
  var ctrl = Get.put(DashCtrl());
  late final tabCtrl = TabController(length: 5, vsync: this);

  @override
  Widget build(BuildContext context) {
    var funcList = [
      ctrl.storeService.getAllProducts(),
      ctrl.storeService.getCategory('jewelery'),
      ctrl.storeService.getCategory('men\'s clothing'),
      ctrl.storeService.getCategory('women\'s clothing'),
      ctrl.storeService.getCategory('electronics'),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
          ),
          IconButton(
            onPressed: () {
              Get.to(CartView());
            },
            icon: const Icon(Icons.shopping_cart_outlined),
          ),
        ],
      ),
      drawer: const Drawer(),
      body: Column(
        children: [
          KTabBar(
            tabCtrl: tabCtrl,
            ontap: (value) {
              ctrl.setInt(value);
            },
          ),
          Gap(15.0.h),
          Expanded(
            child: Obx(
              () => ProductList(
                stream: funcList[ctrl.index.value].asStream(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
