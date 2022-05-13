import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/widgets/movie_card.dart';

class ComingSoon extends StatefulWidget {
  const ComingSoon({Key? key}) : super(key: key);

  @override
  State<ComingSoon> createState() => _ComingSoonState();
}

class _ComingSoonState extends State<ComingSoon> {
 List dummyImage = [
    {
      'url':
          'https://cdn.shopify.com/s/files/1/0057/3728/3618/products/108b520c55e3c9760f77a06110d6a73b_e97cf224-d57f-44e3-8477-4f5479cd746b_500x749.jpg?v=1573616089',
    },
    {
      'url':
          'https://cdn.shopify.com/s/files/1/0057/3728/3618/products/068a90d99903ee7323fb787f83907ad9_e8644835-2b49-44e2-9e88-09ec543586f9_500x749.jpg?v=1573593865',
    },
    {
      'url':
          'https://cdn.shopify.com/s/files/1/0057/3728/3618/products/cedcf0e4209895fce418196e333507ad_54154c41-79c2-4688-93e6-88283b8cfd36_500x749.jpg?v=1573592554',
    },
    {
      'url':
          'https://cdn.shopify.com/s/files/1/0057/3728/3618/products/108fdcc83e78192f1bd2084709a2e7d1_71580467-f819-4a5e-87b0-94b412bbc81a_500x749.jpg?v=1573593624',
    },
    {
      'url':
          'https://cdn.shopify.com/s/files/1/0057/3728/3618/products/0a0bb3cabc29cd5f4b7a158fd1a4b767_aacf7c95-20fe-474f-8e85-d2766f55c42a_500x749.jpg?v=1573594999',
    },
    {
      'url':
          'https://cdn.shopify.com/s/files/1/0057/3728/3618/products/2dfa6f0fe4b4a397c338a8db995b5539_500x749.jpg?v=1573572643',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Const.colorPrimary,
      body: Container(
        padding: EdgeInsets.fromLTRB(18.w, 0, 18.w, 0),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(height: 24.h),
            // GridView.builder(
            //   padding: EdgeInsets.zero,
            //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //     crossAxisCount: 2,
            //     crossAxisSpacing: 12.w,
            //     mainAxisSpacing: 12.h,
            //     childAspectRatio: 16.w / 35.h,
            //   ),
            //   primary: false,
            //   shrinkWrap: true,
            //   itemCount: dummyImage.length,
            //   itemBuilder: (context, index) {
            //     return MovieCard(
            //       movie: ,
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
