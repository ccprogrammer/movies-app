// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/src/size_extension.dart';
// import 'package:movies_app/constants.dart';
// import 'package:movies_app/provider/coming_soon_provider.dart';
// import 'package:movies_app/provider/now_playing_provider.dart';
// import 'package:movies_app/provider/popular_provider.dart';
// import 'package:movies_app/widgets/loading/shimmer_home_movie.dart';
// import 'package:movies_app/widgets/movie_card.dart';
// import 'package:provider/provider.dart';

// class MoviesTab extends StatefulWidget {
//   const MoviesTab({Key? key, required this.provider, required this.model})
//       : super(key: key);
//   final Provider provider;
//   final List<Object> model;

//   @override
//   State<MoviesTab> createState() => _MoviesTabState();
// }

// class _MoviesTabState extends State<MoviesTab> {
//   final List providerList = [
//     NowPlayingProvider(),
//     UpcomingProvider(),
//     PopularProvider(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Const.colorPrimary,
//       body: Container(
//         padding: EdgeInsets.fromLTRB(18.w, 0, 18.w, 0),
//         child: SingleChildScrollView(
//           child: _buildMoviesGrid(provider: widget.provider),
//         ),
//       ),
//     );
//   }

//   Widget _buildMoviesGrid({required Provider provider}) {
//     return Consumer<provider>(
//       builder: (context, data, child) {
//         if (data.isLoading == true) return _buildIsLoading();
//         return _buildMovies(data: widget.model);
//       },
//     );
//   }

//   Widget _buildMovies({data}) {
//     return Container(
//       margin: EdgeInsets.fromLTRB(0, 24.h, 0, 68.h),
//       child: GridView.builder(
//         padding: EdgeInsets.zero,
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           crossAxisSpacing: 12.w,
//           mainAxisSpacing: 12.h,
//           childAspectRatio: 16.w / 35.h,
//         ),
//         primary: false,
//         shrinkWrap: true,
//         itemCount: data.length,
//         itemBuilder: (context, index) {
//           return MovieCard(
//             movie: data[index],
//           );
//         },
//       ),
//     );
//   }

//   Widget _buildIsLoading() {
//     return GridView.builder(
//       padding: EdgeInsets.zero,
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         crossAxisSpacing: 12.w,
//         mainAxisSpacing: 0.h,
//         childAspectRatio: 16.w / 35.h,
//       ),
//       primary: false,
//       shrinkWrap: true,
//       itemCount: 6,
//       itemBuilder: (context, index) {
//         return ShimmerHomeMovies();
//       },
//     );
//   }
// }
