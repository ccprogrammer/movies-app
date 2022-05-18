import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/pages/movie_details/movie_details_page.dart';
import 'package:movies_app/provider/favorite_provider.dart';
import 'package:movies_app/provider/now_playing_provider.dart';
import 'package:movies_app/provider/recommendations_provider.dart';
import 'package:movies_app/widgets/custom_appbar.dart';
import 'package:movies_app/widgets/expandable_text.dart';
import 'package:movies_app/widgets/favorite_tile.dart';
import 'package:movies_app/widgets/loading/skeleton.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class FavoriteMovies extends StatefulWidget {
  const FavoriteMovies({Key? key}) : super(key: key);

  @override
  State<FavoriteMovies> createState() => _FavoriteMoviesState();
}

class _FavoriteMoviesState extends State<FavoriteMovies> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Const.colorPrimary,
      appBar: CustomAppbar(
        title: 'Favorites',
        noLeading: true,
      ),
      body: Consumer<FavoriteProvider>(
        builder: (context, data, child) {
          // if (data.isLoading) _buildIsLoading();
          return _buildFavorites(data: data.favorite);
        },
      ),
    );
  }

  Widget _buildFavorites({data}) {
    return ListView(
      children: [
        for (var item in data) FavoriteTile(movie: item),
      ],
    );
  }

  Widget _buildIsLoading() {
    return ListView(
      children: [
        for (var i = 0; i < 4; i++)
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Shimmer.fromColors(
                  baseColor: Colors.grey[500]!,
                  highlightColor: Colors.grey[300]!,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(18, 24, 18, 0),
                    child: Column(
                      children: [
                        Skeleton(
                          height: 168.h,
                          width: double.infinity,
                          radius: 4.r,
                        ),
                        for (var i = 0; i < 2; i++)
                          Skeleton(
                            width: double.infinity,
                            height: 20.h,
                            marginTop: 8.h,
                            radius: 4.r,
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
