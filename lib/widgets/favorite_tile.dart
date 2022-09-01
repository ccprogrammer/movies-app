import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/helper/helper.dart';
import 'package:movies_app/models/favorite_model.dart';
import 'package:movies_app/pages/movie_details/movie_details_page.dart';
import 'package:movies_app/provider/favorite_provider.dart';
import 'package:movies_app/widgets/loading/skeleton.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class FavoriteTile extends StatelessWidget {
  const FavoriteTile({Key? key, required this.movie}) : super(key: key);
  final dynamic movie;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        helper(context)
            .NavigateTo(destination: MovieDetailsPage(movieId: movie.id));
      },
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(18.w, 18.h, 24.w, 18.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    width: 84.w,
                    height: 84.h,
                    fit: BoxFit.cover,
                    alignment: Alignment.bottomCenter,
                    imageUrl: movie.poster.toString(),
                    placeholder: (context, url) => Shimmer.fromColors(
                        child: Skeleton(),
                        baseColor: Colors.grey[500]!,
                        highlightColor: Colors.grey[300]!),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // nama
                      Text(
                        movie.title ?? '',
                        style: Const.textPrimary.copyWith(
                          fontSize: 14,
                          fontWeight: Const.medium,
                        ),
                        maxLines: 2,
                      ),
                      SizedBox(height: 8.h),

                      Text(
                        movie.synopsis ?? '',
                        style: Const.textSecondary.copyWith(fontSize: 12),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 62.w),
              ],
            ),
          ),
          Positioned(
            top: 18,
            right: 18,
            child: Consumer<FavoriteProvider>(
              builder: (context, add, child) {
                return GestureDetector(
                  onTap: () {
                    add.setFavorite(movie);
                    print('asdasd');
                  },
                  child: Image.asset(
                    'assets/icon_save.png',
                    width: 20.w,
                    height: 20.h,
                    color: Const.colorBlue,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
