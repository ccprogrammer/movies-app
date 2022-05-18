import 'package:flutter/material.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/provider/similar_movie_provider.dart';
import 'package:movies_app/widgets/custom_appbar.dart';
import 'package:movies_app/widgets/loading/shimmer_view_all.dart';
import 'package:movies_app/widgets/view_all_card.dart';
import 'package:provider/provider.dart';

class SimilarMoviesAll extends StatefulWidget {
  const SimilarMoviesAll({Key? key}) : super(key: key);

  @override
  State<SimilarMoviesAll> createState() => _SimilarMoviesAllState();
}

class _SimilarMoviesAllState extends State<SimilarMoviesAll> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Const.colorPrimary,
      appBar: CustomAppbar(title: 'Similar Movies'),
      body: Consumer<SimilarMovieProvider>(
        builder: (context, data, child) {
          if (data.isLoading) ShimmerViewAll();
          return ListView(
            children: data.similarMovie
                .map((item) => ViewAllCard(data: item))
                .toList(),
          );
        },
      ),
    );
  }

}
