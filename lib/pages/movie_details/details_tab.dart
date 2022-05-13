import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/models/movie_model.dart';
import 'package:movies_app/pages/view_all/similar_all.dart';
import 'package:movies_app/pages/view_all/cast_all.dart';
import 'package:movies_app/pages/view_all/photos_all.dart';
import 'package:movies_app/provider/similar_movie_provider.dart';
import 'package:movies_app/widgets/cast_tile.dart';
import 'package:movies_app/widgets/expandable_text.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class DetailsTab extends StatefulWidget {
  const DetailsTab({Key? key, this.movie}) : super(key: key);
  final MovieModel? movie;

  @override
  State<DetailsTab> createState() => _DetailsTabState();
}

class _DetailsTabState extends State<DetailsTab> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        SizedBox(height: 12.h),
        _buildSynopsis(),
        // _buildCast(),
        // _buildPhotos(),
        // _buildVideos(),
        _buildSimilar(),
        SizedBox(height: 24.h),
      ],
    );
  }

  Widget _buildSynopsis() {
    return Container(
      margin: EdgeInsets.fromLTRB(18.w, 0, 18.w, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Synopsis',
            style: Const.textPrimary.copyWith(
              fontSize: 18,
            ),
          ),
          SizedBox(height: 16),
          ExpandableText(
            '${widget.movie!.synopsis}',
            trimLines: 4,
            style: Const.textSecondary,
          ),
        ],
      ),
    );
  }

  Widget _buildCast() {
    return Container(
      margin: EdgeInsets.fromLTRB(0.w, 20.h, 0.w, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle(
              title: 'Cast & Crew',
              route: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CastCrew()))),
          for (var i = 0; i < 3; i++) CastTile(),
        ],
      ),
    );
  }

  Widget _buildPhotos() {
    return Container(
      margin: EdgeInsets.fromLTRB(0.w, 20.h, 0.w, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle(
              title: 'Photos',
              route: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Photos()))),
          Container(
            margin: EdgeInsets.fromLTRB(0, 8, 0, 0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(width: 18),
                  for (var i = 0; i < 4; i++)
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 8.w, 0),
                      width: 104.w,
                      height: 88.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(Const.dummyImage),
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter,
                        ),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(10),
                          onTap: () {},
                        ),
                      ),
                    ),
                  SizedBox(width: 12),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVideos() {
    return Container(
      margin: EdgeInsets.fromLTRB(0.w, 20.h, 0.w, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle(
            title: 'Videos',
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 8, 0, 0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(width: 18),
                  for (var i = 0; i < 4; i++)
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 8.w, 0),
                      width: 104.w,
                      height: 88.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(Const.dummyImage),
                          alignment: Alignment.topCenter,
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(10),
                          onTap: () {},
                        ),
                      ),
                    ),
                  SizedBox(width: 12),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSimilar() {
    return Container(
      margin: EdgeInsets.fromLTRB(0.w, 20.h, 0.w, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle(
              title: 'Similar Movies',
              route: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SimilarMoviesAll()));
              }),
          SizedBox(height: 8.h),
          _buildHorizontalSimilar(),
        ],
      ),
    );
  }

  Widget _buildHorizontalSimilar() {
    var data = Provider.of<SimilarMovieProvider>(context).similarMovie;

    if (data.isEmpty) {
      return Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: 18.w),
              for (int i = 0; i < 5; i++)
                Shimmer.fromColors(
                  baseColor: Colors.grey[500]!,
                  highlightColor: Colors.grey[300]!,
                  child: Container(
                    margin: EdgeInsets.only(right: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 120.h,
                          width: 160.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: Colors.grey,
                          ),
                          
                        ),
                        for (var i = 0; i < 2; i++)
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 4, 0, 0),
                            height: 16.h,
                            width: 160.w,
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
        ),
      );
    } else {
      return Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: 18.w),
              for (int i = 0; i < 5; i++)
                Container(
                  margin: EdgeInsets.only(right: 20.w),
                  width: 160.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 120.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          image: DecorationImage(
                            image: NetworkImage(
                              data[i].poster ?? Const.dummyImage,
                            ),
                            fit: BoxFit.cover,
                            alignment: Alignment.topCenter,
                            colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.3),
                                BlendMode.darken),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 12.h, 0, 0),
                        child: Text(
                          data[i].synopsis ?? '',
                          style: Const.textSecondary,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 4.h, 0, 0),
                        child: Text(
                          data[i].title ?? '',
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: Const.textPrimary.copyWith(
                            fontWeight: Const.medium,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              SizedBox(width: 4),
            ],
          ),
        ),
      );
    }
  }

  // Reuseable Widget
  Widget _buildSectionTitle({String? title, Function? route}) {
    return Container(
      margin: EdgeInsets.fromLTRB(18, 0, 18, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title ?? 'Section Title',
            style: Const.textPrimary.copyWith(
              fontSize: 18.sp,
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              shape: StadiumBorder(),
              minimumSize: Size.zero,
              padding: EdgeInsets.fromLTRB(10, 6, 10, 6),
            ),
            onPressed: () {
              route!();
            },
            child: Text(
              'View All',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: Const.medium,
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
