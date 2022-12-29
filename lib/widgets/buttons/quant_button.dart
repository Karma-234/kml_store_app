import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import 'counter_button.dart';

class QuantityButton extends StatelessWidget {
  const QuantityButton({
    Key? key,
    this.addItem,
    this.removeItem,
    required this.itemCount,
  }) : super(key: key);

  final dynamic Function()? addItem;
  final dynamic Function()? removeItem;
  final String itemCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CounterButton(
          icon: Icons.add,
          onPressd: addItem,
        ),
        Gap(10.0.w),
        Text(
          itemCount,
          textAlign: TextAlign.justify,
          style: GoogleFonts.inter(fontSize: 14.0.sp, height: 21 / 14),
        ),
        Gap(10.0.w),
        CounterButton(
          icon: FontAwesomeIcons.minus,
          onPressd: removeItem,
        ),
      ],
    );
  }
}
