import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/widgets/cast_tile.dart';

class Blogs extends StatefulWidget {
  const Blogs({Key? key}) : super(key: key);

  @override
  State<Blogs> createState() => _PhotosState();
}

class _PhotosState extends State<Blogs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Const.colorPrimary,
      appBar: _buildAppBar(),
      body: _buildBlogList(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      iconTheme: IconThemeData(color: Colors.white),
      backgroundColor: Const.colorPrimary,
      elevation: 1,
      titleSpacing: 0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      leading: IconButton(
        padding: EdgeInsets.zero,
        constraints: BoxConstraints(),
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.chevron_left,
          size: 32,
        ),
      ),
      title: Text(
        'Blogs About This Film',
        style: Const.textPrimary.copyWith(
          fontSize: 18,
          fontWeight: Const.semiBold,
        ),
      ),
      bottom: PreferredSize(
          child: Container(
            color: Const.colorIndicatorBorder,
            height: 1.0,
          ),
          preferredSize: Size.fromHeight(4.0)),
    );
  }

  Widget _buildBlogList() {
    return ListView(
      children: [
        SizedBox(height: 10.h),
        for (var i = 0; i < 5; i++)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 340.w,
                height: 168.h,
                margin: EdgeInsets.fromLTRB(18, 24, 18, 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: NetworkImage(Const.dummyImage),
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(18, 16, 18, 0),
                child: Text(
                  '3 hours ago',
                  style: Const.textSecondary,
                ),
              ),
            
               Container(
                margin: EdgeInsets.fromLTRB(18, 4, 18, 0),
                 child: Text(
            'The Best John Wick Action Scenes',
            style: Const.textPrimary.copyWith(fontSize: 16),
          ),
               ),
            ],
          ),
      ],
    );
  }
}
