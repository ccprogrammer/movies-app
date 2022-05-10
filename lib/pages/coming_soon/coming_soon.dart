import 'package:flutter/material.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/widgets/movie_card.dart';

class ComingSoon extends StatefulWidget {
  const ComingSoon({Key? key}) : super(key: key);

  @override
  State<ComingSoon> createState() => _ComingSoonState();
}

class _ComingSoonState extends State<ComingSoon> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Const.colorPrimary,
      body: Container(
        padding: EdgeInsets.fromLTRB(18, 0, 18, 0),
        child: ListView(
          children: [
            SizedBox(height: 24),
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                childAspectRatio: 16 / 32,
              ),
              primary: false,
              shrinkWrap: true,
              itemCount: 8,
              itemBuilder: (context, index) {
                return MovieCard();
              },
            ),
          ],
        ),
      ),
    );
  }
}
