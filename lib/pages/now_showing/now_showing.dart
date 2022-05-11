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
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpuS7X73lEISdR5-_ApKxjwJb8vMgByd7Y-A&usqp=CAU',
    },
    {
      'url':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHcfyA36cNEVwBhKVtU3uXu-8qbvoTcfad0g&usqp=CAU',
    },
    {
      'url':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOLuzQv3LVAGNIlDel3ysldkKwADqk4wrTBA&usqp=CAU',
    },
    {
      'url':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGirzh7b-O3JRhddi9TtIFnLUUl72gEi6rrQ&usqp=CAU',
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
