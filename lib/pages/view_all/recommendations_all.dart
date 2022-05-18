import 'package:flutter/material.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/provider/recommendations_provider.dart';
import 'package:movies_app/widgets/custom_appbar.dart';
import 'package:movies_app/widgets/loading/shimmer_view_all.dart';
import 'package:movies_app/widgets/view_all_card.dart';
import 'package:provider/provider.dart';

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
      appBar: CustomAppbar(title: 'Recommendations'),
      body: Consumer<RecommendationsProvider>(
        builder: (context, data, child) {
          if (data.isLoading) ShimmerViewAll();
          return ListView(
            children: data.recommendationsMovie
                .map((item) => ViewAllCard(data: item))
                .toList(),
          );
        },
      ),
    );
  }
}
