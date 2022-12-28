import 'package:ecommerce_app/core/services/api/store_api/store_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CartView extends StatelessWidget {
  CartView({super.key});
  var getCart = StoreApi();

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
                ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Clear cart'),
                    ],
                  ),
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
