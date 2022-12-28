import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class KTabBar extends StatelessWidget {
  const KTabBar({Key? key, required this.tabCtrl, this.ontap})
      : super(key: key);

  final TabController tabCtrl;
  final Function(int)? ontap;

  @override
  Widget build(BuildContext context) {
    return TabBar(
        labelColor: Colors.black,
        labelStyle: GoogleFonts.inter(color: Colors.black, fontSize: 18.0.sp),
        unselectedLabelColor: Colors.blueGrey,
        unselectedLabelStyle:
            GoogleFonts.inter(fontSize: 7.0.sp, height: 11 / 7.0),
        controller: tabCtrl,
        onTap: ontap,
        tabs: const [
          Text(
            'All',
            overflow: TextOverflow.fade,
            maxLines: 1,
          ),
          Text(
            'Jewelery',
            overflow: TextOverflow.fade,
            maxLines: 1,
          ),
          Text(
            'Men\'s Clothing',
            overflow: TextOverflow.fade,
            maxLines: 1,
          ),
          Text(
            'Women\'s Clothing',
            overflow: TextOverflow.fade,
            maxLines: 1,
          ),
          Text(
            'Electronics',
            overflow: TextOverflow.fade,
            maxLines: 1,
          ),
        ]);
  }
}
