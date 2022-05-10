import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';

class Const {

  static const String dummyImage =  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJj8mi21whbhJRrCU09210xZBByEQOVDZNGw&usqp=CAU';
  // colors
  static const Color colorPrimary = Color(0xff0F1B2B);
  static const Color colorIndicator = Color(0xffD9251D);
  static const Color colorIndicatorBorder = Color(0xff2C3F5B);

  // fontweight
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;

  // textstyle
  static TextStyle textPrimary = TextStyle(
    color: Colors.white,
    fontWeight: semiBold,
    fontSize: 24.sp,
  );

  static TextStyle textSecondary = TextStyle(
    color: Colors.grey,
    fontWeight: medium,
    fontSize: 14.sp,
  );
}
