import 'package:flutter/material.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/widgets/chat_bubble.dart';

class ReviewsTab extends StatefulWidget {
  const ReviewsTab({Key? key}) : super(key: key);

  @override
  State<ReviewsTab> createState() => _ReviewsTabState();
}

class _ReviewsTabState extends State<ReviewsTab> {
  double rating = 0.0;
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Center(
          child: Text(
            '38 Reviews',
            style: Const.textSecondary.copyWith(fontSize: 16),
          ),
        ),
        for (var i = 0; i < 5; i++) ChatBubble(),
      ],
    );
  }
}
