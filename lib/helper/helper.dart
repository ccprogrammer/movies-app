import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

  NavigateTo({Widget? destination, bool isReplace = false}) {
    isReplace
        ? Navigator.pushReplacement(
            context,
            CupertinoPageRoute(
              builder: (context) => destination!,
            ),
          )
        : Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => destination!,
            ),
          );

    return;
  }
}
