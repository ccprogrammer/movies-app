import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/pages/view_all/blogs.dart';
import 'package:movies_app/pages/view_all/cast.dart';
import 'package:movies_app/pages/view_all/photos.dart';
import 'package:movies_app/widgets/cast_tile.dart';
import 'package:movies_app/widgets/expandable_text.dart';

class DetailsTab extends StatefulWidget {
  const DetailsTab({Key? key}) : super(key: key);

  @override
  State<DetailsTab> createState() => _DetailsTabState();
}

class _DetailsTabState extends State<DetailsTab> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        _buildSynopsis(),
        _buildCast(),
        _buildPhotos(),
        _buildVideos(),
        _buildBlogs(),
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
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris aliquam volutpat tellus at fringilla. Interdum et malesuada fames ac ante ipsum primis in faucibus. Phasellus rhoncus gravida dignissim. Nulla viverra ante nec lacus gravida lacinia. Vivamus condimentum risus quis mattis aliquet. Fusce semper orci in est eleifend hendrerit. Praesent viverra velit quis nisl viverra, at bibendum est vulputate. Donec at tempus.',
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

  Widget _buildBlogs() {
    return Container(
      margin: EdgeInsets.fromLTRB(0.w, 20.h, 0.w, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle(
              title: 'Blogs About This Film',
              route: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Blogs()))),
          SizedBox(height: 8.h),
          Container(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(width: 18.w),
                  for (int i = 0; i < 4; i++)
                    Container(
                      margin: EdgeInsets.only(right: 20.w),
                      width: 160.w,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10.r),
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 120.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      Const.dummyImage,
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
                                  '3 hours ago',
                                  style: Const.textSecondary,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 4.h, 0, 0),
                                child: Text(
                                  'Female Action Stars We Can\’t Wait',
                                  maxLines: 2,
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
                      ),
                    ),
                  SizedBox(width: 4),
                ],
              ),
            ),
          ),
        ],
      ),
    );
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
