import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/models/movie_model.dart';
import 'package:movies_app/provider/recommendations_provider.dart';
import 'package:movies_app/provider/similar_movie_provider.dart';
import 'package:movies_app/widgets/cast_tile.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class RecommendationsAll extends StatefulWidget {
  const RecommendationsAll({Key? key}) : super(key: key);

  @override
  State<RecommendationsAll> createState() => _RecommendationsAllState();
}

class _RecommendationsAllState extends State<RecommendationsAll> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Const.colorPrimary,
      appBar: _buildAppBar(),
      body: _buildSimilarList(),
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
        'Similar Movies',
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

  Widget _buildSimilarList() {

    return Consumer<RecommendationsProvider>(
      builder: (context, data, child) {
        if (data.recommendationsMovie.isEmpty) {
          return ListView(
            children: [
              SizedBox(height: 10.h),
              for (var i = 0; i < 4; i++)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Shimmer.fromColors(
                      baseColor: Colors.grey[500]!,
                      highlightColor: Colors.grey[300]!,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(18, 24, 18, 0),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: Colors.grey,
                              ),
                              height: 168.h,
                              width: double.infinity,
                            ),
                            for (var i = 0; i < 2; i++)
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 8, 0, 0),
                                height: 16.h,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.r),
                                  color: Colors.grey,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          );
        } else {
          return ListView(
            children: [
              SizedBox(height: 10.h),
              for (var item in data.recommendationsMovie)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 168.h,
                      width: double.infinity,
                      margin: EdgeInsets.fromLTRB(18, 24, 18, 0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: NetworkImage(item.poster ?? Const.dummyImage),
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(18, 14, 18, 0),
                      child: Text(
                        item.title ?? '',
                        style: Const.textPrimary.copyWith(fontSize: 16),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(18, 6, 18, 0),
                      child: Text(
                        item.synopsis ?? '',
                        style: Const.textSecondary,
                      ),
                    ),
                  ],
                ),
            ],
          );
        }
      },
    );
  }
}
