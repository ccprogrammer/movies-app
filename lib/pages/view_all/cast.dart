import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/widgets/cast_tile.dart';

class CastCrew extends StatefulWidget {
  const CastCrew({Key? key}) : super(key: key);

  @override
  State<CastCrew> createState() => _CastCrewState();
}

class _CastCrewState extends State<CastCrew> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Const.colorPrimary,
      appBar: _buildAppBar(),
      body: _buildCastList(),
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
        'Cast & Crew',
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

  Widget _buildCastList() {
    return ListView(
      children: [
        SizedBox(height: 10.h),
        for(var i = 0; i < 5;  i++)
        CastTile(),
      ],
    );
  }
}
