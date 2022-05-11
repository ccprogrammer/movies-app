import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:movies_app/constants.dart';

class ChatBubble extends StatefulWidget {
  const ChatBubble({Key? key, this.data}) : super(key: key);
  final dynamic data;

  @override
  State<ChatBubble> createState() => _ChatBubbleState();
}

class _ChatBubbleState extends State<ChatBubble> {
  double rating = 0.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(18.w, 24.h, 18.w, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomPaint(
            painter: Bubble(),
            child: Container(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 24.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RatingBar.builder(
                      initialRating: 5,
                      minRating: 0,
                      direction: Axis.horizontal,
                      glow: false,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.w),
                      ignoreGestures: true,
                      itemSize: 16.w,
                      itemBuilder: (context, _) => Image.asset(
                        'assets/icon_star.png',
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (double value) {
                        this.rating = rating;
                      },
                    ),
                    SizedBox(height: 8),
                    Text(
                      'This is the legendary Lorem Ipsum Brother ',
                      style: Const.textSecondary,
                    ),
                  ],
                ),
              ),
            ),
          ),

          // user
          ListTile(
            contentPadding: EdgeInsets.fromLTRB(6, 0, 0, 0),
            leading: Container(
              width: 46.w,
              height: 46.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(Const.dummyImage),
                  fit: BoxFit.cover,
                ),
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
            title: Text(
              'Devin	Hopkins',
              style: Const.textPrimary.copyWith(fontSize: 14.sp),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            subtitle: Text(
              'May 20, 2019',
              style: Const.textSecondary.copyWith(fontSize: 12.sp),
              maxLines: 1,
            ),
            trailing: SizedBox(
              width: 60,
            ),
          ),
        ],
      ),
    );
  }
}

class Bubble extends CustomPainter {
  double _radius = 5.0;
  double _x = 10.0;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRRect(
        RRect.fromLTRBAndCorners(
          0,
          0,
          size.width - _x,
          size.height - 10,
          bottomLeft: Radius.circular(_radius),
          bottomRight: Radius.circular(_radius),
          topRight: Radius.circular(_radius),
          topLeft: Radius.circular(_radius),
        ),
        Paint()
          ..color = Const.colorChatBubble
          ..style = PaintingStyle.fill);
    var path = Path();
    path.moveTo(20, size.height - 12);
    path.lineTo(30, size.height);
    path.lineTo(40, size.height - 10);
    canvas.clipPath(path);
    canvas.drawRRect(
        RRect.fromLTRBAndCorners(
          0,
          0.0,
          size.width,
          size.height,
        ),
        Paint()
          ..color = Const.colorChatBubble
          ..style = PaintingStyle.fill);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}