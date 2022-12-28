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
                ctrl.moreDetails(
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
