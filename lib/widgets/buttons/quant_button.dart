import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import 'counter_button.dart';

class QuantButtton extends StatelessWidget {
  const QuantButtton({
    super.key,
    this.onMinus,
    this.onadd,
    required this.value,
  });
  final dynamic Function()? onadd;
  final dynamic Function()? onMinus;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CounterButton(
          icon: Icons.add,
          onPressd: onadd,
        ),
        Gap(10.0.w),
        Text(
          value,
          textAlign: TextAlign.justify,
          style: GoogleFonts.inter(fontSize: 14.0.sp, height: 21 / 14),
        ),
        Gap(10.0.w),
        CounterButton(
          icon: FontAwesomeIcons.minus,
          onPressd: onMinus,
        ),
      ],
    );
  }
}
