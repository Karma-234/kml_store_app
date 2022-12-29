import 'dart:convert';

import 'package:ecommerce_app/controllers/dash_controller.dart';
import 'package:ecommerce_app/core/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductList extends StatelessWidget {
  ProductList({
    super.key,
    required this.stream,
  });
  final Stream<dynamic>? stream;
  final ctrl = Get.put(DashCtrl());

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: stream,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        var data = snapshot.data!;

        return ListView.separated(
          itemCount: data.length,
          separatorBuilder: (context, index) {
            return const Divider();
          },
          itemBuilder: (context, index) {
            return ListTile(
              dense: true,
              leading: data[index]['image'] == null
                  ? const CircleAvatar()
                  : Image(
                      image: NetworkImage(data[index]['image']),
                      width: 59.0.w,
                    ),
              title: Text(data[index]['title'].toString()),
              subtitle: Text(
                data[index]['description'].toString(),
                textAlign: TextAlign.justify,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: GoogleFonts.inter(),
              ),
              trailing: Text('\$${data[index]['price'].toString()}'),
              onTap: () {
                ctrl.moreDetails(
                  context,
                  ctrl,
                  ProductModel(
                    title: data[index]['title'],
                    imgUrl: data[index]['image'],
                    description: data[index]['description'],
                    price: '\$${data[index]['price'].toString()}',
                    id: data[index]['id'].toString(),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
