import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/helper/helper.dart';
import 'package:movies_app/pages/movie_details/movie_details_page.dart';
import 'package:movies_app/provider/search_movie_provider.dart';
import 'package:movies_app/widgets/loading/shimmer_tile.dart';
import 'package:movies_app/widgets/loading/skeleton.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class SearchMoviePage extends StatefulWidget {
  const SearchMoviePage({Key? key}) : super(key: key);

  @override
  State<SearchMoviePage> createState() => _SearchMoviePageState();
}

class _SearchMoviePageState extends State<SearchMoviePage> {
  var _searchController = TextEditingController(text: '');

  handleExit(data) {
    FocusScope.of(context).unfocus();
    Navigator.pop(context);
  }

  handleSearch(provider) {
    FocusScope.of(context).unfocus();
    provider.searchMovie(_searchController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Const.colorPrimary,
      appBar: _buildAppBar(),
      body: ListView(
        children: [
          _buildSearchedMovies(),
        ],
      ),
    );
  }

  Widget _buildSearchedMovies() {
    return Consumer<SearchedMoviesProvider>(
      builder: (context, data, child) {
        if (data.isLoading) return _buildIsLoading();
        if (data.noMovies == true || data.isError == true)
          return _buildCannotFindMovie();
        return _buildMoviesTile(
          data: data.searchedMovies,
        );
      },
    );
  }

  Widget _buildMoviesTile({data}) {
    return Column(
      children: [
        SizedBox(height: 14),
        for (var item in data)
          InkWell(
            onTap: () {
              helper(context).NavigateTo(
                  destination: MovieDetailsPage(
                movieId: item.id,
              ));
            },
            child: Container(
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
                      imageUrl: item.poster.toString(),
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // nama
                        Text(
                          item.title ?? '',
                          style: Const.textPrimary.copyWith(
                            fontSize: 14,
                            fontWeight: Const.medium,
                          ),
                          maxLines: 2,
                        ),
                        SizedBox(height: 4.h),

                        Text(
                          item.synopsis ?? '',
                          style: Const.textSecondary.copyWith(fontSize: 12),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 4.h),
                      ],
                    ),
                  ),
                  SizedBox(width: 24.w),
                ],
              ),
            ),
          ),
      ],
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
      leading: Consumer<SearchedMoviesProvider>(
        builder: (context, provider, child) {
          return IconButton(
            onPressed: () {
              handleExit(provider);
            },
            icon: Icon(
              Icons.chevron_left,
              size: 32,
            ),
          );
        },
      ),
      title:
          Consumer<SearchedMoviesProvider>(builder: (context, provider, child) {
        return Container(
          height: 45,
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          margin: EdgeInsets.fromLTRB(0, 0, 24, 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Const.colorChatBubble,
          ),
          child: Focus(
            onFocusChange: (focus) {},
            child: TextField(
              controller: _searchController,
              style: Const.textPrimary.copyWith(
                fontSize: 14,
              ),
              onEditingComplete: () {
                handleSearch(provider);
              },
              decoration: InputDecoration(
                hintText: 'Search Movie',
                hintStyle: Const.textSecondary,
                border: InputBorder.none,
              ),
            ),
          ),
        );
      }),
      actions: [
        Consumer<SearchedMoviesProvider>(
          builder: (context, provider, child) {
            return IconButton(
              padding: EdgeInsets.zero,
              constraints: BoxConstraints(),
              onPressed: () {
                handleSearch(provider);
              },
              icon: Image.asset(
                'assets/icon_search.png',
                width: 24,
                height: 24,
              ),
            );
          },
        ),
        SizedBox(width: 18),
      ],
      bottom: PreferredSize(
          child: Container(
            color: Const.colorIndicatorBorder,
            height: 1.0,
          ),
          preferredSize: Size.fromHeight(4.0)),
    );
  }

  // Error Condition
  Widget _buildIsLoading() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        for (int i = 0; i < 5; i++) ShimmerTile(),
      ],
    );
  }

  Widget _buildCannotFindMovie() {
    return Container(
      margin: EdgeInsets.only(top: 300),
      child: Center(
        child: Text(
          'Cannot Find Movie',
          style: Const.textPrimary,
        ),
      ),
    );
  }
}
