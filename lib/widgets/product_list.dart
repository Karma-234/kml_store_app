import 'package:ecommerce_app/controllers/dash_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:google_fonts/google_fonts.dart';

import 'buttons/quant_button.dart';
import 'exports.dart';

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
                moreDetails(
                  context,
                  data[index]['image'],
                  data[index]['title'],
                  data[index]['description'],
                  '\$${data[index]['price'].toString()}',
                  ctrl,
                  data[index]['id'],
                );
              },
            );
          },
        );
      },
    );
  }
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
