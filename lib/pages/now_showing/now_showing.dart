import 'package:flutter/material.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/widgets/movie_card.dart';

class NowShowing extends StatefulWidget {
  const NowShowing({Key? key}) : super(key: key);

  @override
  State<NowShowing> createState() => _NowShowingState();
}

class _NowShowingState extends State<NowShowing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Const.colorPrimary,
      body: Container(
        padding: EdgeInsets.fromLTRB(18, 0, 18, 0),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(height: 24),
            GridView.builder(
              padding: EdgeInsets.zero,
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
