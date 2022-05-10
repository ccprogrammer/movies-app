import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:movies_app/constants.dart';

class CastTile extends StatefulWidget {
  const CastTile({Key? key, this.name}) : super(key: key);
  final String? name;

  @override
  State<CastTile> createState() => _CastTileState();
}

class _CastTileState extends State<CastTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 10.h),
        child: Row(
          children: [
            Container(
              width: 62.w,
              height: 62.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(Const.dummyImage),
                  alignment: Alignment.topCenter,
                  fit: BoxFit.cover,
                ),
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Keanu Reeves',
                    style: Const.textPrimary.copyWith(
                      fontSize: 14.sp,
                      fontWeight: Const.medium,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    'JOHN WICK',
                    style: Const.textSecondary.copyWith(
                      fontSize: 12.sp,
                      fontWeight: Const.medium,
                    ),
                    maxLines: 1,
                  ),
                ],
              ),
            ),
            SizedBox(width: 54.w),
            IconButton(
              constraints: BoxConstraints(),
              padding: EdgeInsets.zero,
              onPressed: () {},
              icon: Icon(
                Icons.more_horiz,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
