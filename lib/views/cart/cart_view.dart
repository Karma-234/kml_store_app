import 'package:ecommerce_app/controllers/cart_controller.dart';
import 'package:ecommerce_app/core/services/api/store_api/store_api.dart';
import 'package:ecommerce_app/widgets/exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CartView extends StatelessWidget {
  CartView({super.key});
  var getCart = StoreApi();
  var ctrl = CartCtrl();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder(
        stream: getCart.getUserCart('1').asStream(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text('Your cart is empty, Place an order now'),
            );
          }
          var data = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        var title = data[index]['products'][index]['productId'];
                        var qty = data[index]['products'][index]['quantity'];
                        return ListTile(
                          title: Text(title.toString()),
                          trailing: Text(qty.toString()),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Divider();
                      },
                      itemCount: data.length),
                ),
                const Spacer(),
                AppButton(
                  title: 'Checkout',
                  icon: Icons.shopping_cart_checkout,
                  onClick: () async {
                    ctrl.checkOut(context);
                  },
                ),
                Gap(16.0.h),
                AppButton(
                  title: 'Clear cart',
                  color: Colors.red,
                  icon: Icons.remove_shopping_cart_rounded,
                  onClick: () async {
                    ctrl.clearCart(context);
                  },
                ),
                Gap(30.0.h),
              ],
            ),
          );
        },
      ),
    );
  }
}
