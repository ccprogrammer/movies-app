import 'package:flutter/material.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/provider/reviews_provider.dart';
import 'package:movies_app/widgets/chat_bubble.dart';
import 'package:provider/provider.dart';

class ReviewsTab extends StatefulWidget {
  const ReviewsTab({Key? key}) : super(key: key);

  @override
  State<ReviewsTab> createState() => _ReviewsTabState();
}

class _ReviewsTabState extends State<ReviewsTab> {
  double rating = 0.0;
  @override
  Widget build(BuildContext context) {
    return Consumer<ReviewsProvider>(builder: (context, data, child) {
      if (data.reviews.isNotEmpty) {
        return ListView(
          padding: EdgeInsets.zero,
          children: [
            // Center(
            //   child: Text(
            //     '38 Reviews',
            //     style: Const.textSecondary.copyWith(fontSize: 16),
            //   ),
            // ),
            for (var item in data.reviews)
              ChatBubble(
                reviews: item,
              ),
          ],
        );
      } else {
        return Center(
              child: Text(
                'NO REVIEWS',
                style: Const.textPrimary,
              ),
            );
      }
    });
  }
}
