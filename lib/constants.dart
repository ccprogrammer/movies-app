import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import '.api.dart';

class Const {
  // Example '$baseUrl/now_playing?api_key=88ce4ef639f3a4e27b5420982212c77d'
  static const String baseUrl = 'https://api.themoviedb.org/3/movie';
  static const String apiKey = '?api_key=${API.apiKey}';

  static const String appName = 'OneMovie';
  static const String dummyImage =
      'https://www.marketeers.com/wp-content/uploads/2019/05/Keanu-Reeves-John-Wick-3-Neon-Poster.jpg';
  // colors
  static const Color colorPrimary = Color(0xff0F1B2B);
  static const Color colorIndicator = Color(0xffD9251D);
  static const Color colorIndicatorBorder = Color(0xff2C3F5B);
  static const Color colorBlue = Color(0xff47CFFF);
  static const Color colorChatBubble = Color(0xff2B3543);
  static const Color colorSplashScreen = Color(0xffE51937);
  static const Color colorSplashScreen2 = Color(0xffDB5252);
  static const Color colorReleaseDate = Colors.green;

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

  static TextStyle textReleaseDate = TextStyle(
    fontWeight: medium,
    fontSize: 14.sp,
    color: colorReleaseDate,
  );
}
