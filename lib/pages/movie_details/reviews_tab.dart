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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ReviewsProvider>(
      builder: (context, data, child) {
        if (data.reviews.isEmpty) {
          return Center(
            child: Text(
              'NO REVIEWS',
              style: Const.textPrimary,
            ),
          );
        } else {
          return ListView(
            padding: EdgeInsets.zero,
            children: [
              for (var item in data.reviews)
                ChatBubble(
                  reviews: item,
                ),
            ],
          );
        }
      },
    );
  }
}
