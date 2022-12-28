import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CounterButton extends StatelessWidget {
  const CounterButton({
    Key? key,
    this.icon,
    this.onPressd,
  }) : super(key: key);
  final IconData? icon;
  final Function()? onPressd;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressd,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(8.0.w, 20.0.h),
      ),
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}
