import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/widgets/movie_card.dart';

class NowShowing extends StatefulWidget {
  const NowShowing({Key? key}) : super(key: key);

  @override
  State<NowShowing> createState() => _NowShowingState();
}

class _NowShowingState extends State<NowShowing> {
  List dummyImage = [
    {
      'url':
          'https://cdn.shopify.com/s/files/1/0057/3728/3618/products/b892c2f862023362da3e66ec2b92a699_90de31ac-e4ca-476e-8cc0-f634509f364b_500x749.jpg?v=1573585334',
    },
    {
      'url':
          'https://cdn.shopify.com/s/files/1/0057/3728/3618/products/0b2b67a1de6a06d1ce65e4ccc64047e3_a9f7318e-c5c4-4d2a-aed2-890bbfad883c_500x749.jpg?v=1573590273',
    },
    {
      'url':
          'https://cdn.shopify.com/s/files/1/0057/3728/3618/products/6cd691e19fffbe57b353cb120deaeb8f_8489d7bf-24ba-4848-9d0f-11f20cb35025_500x749.jpg?v=1573613877',
    },
    {
      'url':
          'https://cdn.shopify.com/s/files/1/0057/3728/3618/products/e50345d7cfee907ad63bb835109b37b9_263eaa00-ac40-4a0e-b2d7-86bb4ac69c90_500x749.jpg?v=1573584652',
    },
    {
      'url':
          'https://cdn.shopify.com/s/files/1/0057/3728/3618/products/e50345d7cfee907ad63bb835109b37b9_263eaa00-ac40-4a0e-b2d7-86bb4ac69c90_500x749.jpg?v=1573584652',
    },
    {
      'url':
          'https://cdn.shopify.com/s/files/1/0057/3728/3618/products/the-batman_tgstxmov_500x749.jpg?v=1641930816',
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
            GridView.builder(
              padding: EdgeInsets.zero,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12.w,
                mainAxisSpacing: 12.h,
                childAspectRatio: 16.w / 35.h,
              ),
              primary: false,
              shrinkWrap: true,
              itemCount: dummyImage.length,
              itemBuilder: (context, index) {
                return MovieCard(
                  url: dummyImage[index]['url'],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
