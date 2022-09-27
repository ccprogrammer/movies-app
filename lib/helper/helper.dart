import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class helper {
  var context;
  helper(this.context);

  SnackBarCommon({String? text, TextStyle? style, Color? color}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: Duration(milliseconds: 2000),
      backgroundColor: color ?? Colors.blue,
      behavior: SnackBarBehavior.floating,
      content: Text(
        text ?? 'Set your title',
        textAlign: TextAlign.center,
        style: style ?? null,
      ),
    ));
  }

  NavigateTo({Widget? destination, bool isRemove = false}) {
    isRemove
        ? Navigator.pushAndRemoveUntil(
            context,
            CupertinoPageRoute(
              builder: (context) => destination!,
            ),
            (route) => false)
        : Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => destination!,
            ),
          );

    return;
  }
}
