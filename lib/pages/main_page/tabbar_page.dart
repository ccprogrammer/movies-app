import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/widgets/loading/refresher.dart';

class TabbarPage extends StatelessWidget {
  const TabbarPage({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Const.colorPrimary,
      body: MyRefresher(
        child: Container(
          padding: EdgeInsets.fromLTRB(18.w, 0, 18.w, 0),
          child: SingleChildScrollView(
            child: this.child,
          ),
        ),
      ),
    );
  }
}
