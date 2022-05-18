import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:movies_app/constants.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({Key? key, required this.title, this.noLeading = false})
      : super(key: key);
  final String title;
  final bool? noLeading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color: Colors.white),
      backgroundColor: Const.colorPrimary,
      elevation: 1,
      titleSpacing: 0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      leading: noLeading == false
          ? IconButton(
              padding: EdgeInsets.zero,
              constraints: BoxConstraints(),
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.chevron_left,
                size: 32.w,
              ),
            )
          : Container(),
      title: Text(
        this.title,
        style: Const.textPrimary.copyWith(
          fontSize: 18.sp,
          fontWeight: Const.semiBold,
        ),
      ),
      bottom: PreferredSize(
          child: Container(
            color: Const.colorIndicatorBorder,
            height: 1.0.h,
          ),
          preferredSize: Size.fromHeight(4.0.h)),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
