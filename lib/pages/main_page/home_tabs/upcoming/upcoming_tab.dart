import 'package:flutter/material.dart';
import 'package:movies_app/pages/main_page/home_tabs/tab_content.dart';
import 'package:movies_app/pages/main_page/home_tabs/tab_loading.dart';
import 'package:movies_app/provider/upcoming_provider.dart';
import 'package:provider/provider.dart';

class Upcoming extends StatelessWidget {
  const Upcoming({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<UpcomingProvider>(
      builder: (context, data, child) {
        if (data.isLoading == true) return TabLoading();
        return TabContent(data: data.upcoming);
      },
    );
  }
}
