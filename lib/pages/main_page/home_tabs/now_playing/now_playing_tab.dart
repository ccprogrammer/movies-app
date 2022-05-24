import 'package:flutter/material.dart';
import 'package:movies_app/pages/main_page/home_tabs/tab_content.dart';
import 'package:movies_app/pages/main_page/home_tabs/tab_loading.dart';
import 'package:movies_app/provider/now_playing_provider.dart';
import 'package:provider/provider.dart';

class NowPlaying extends StatelessWidget {
  const NowPlaying({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<NowPlayingProvider>(
      builder: (context, data, child) {
        if (data.isLoading == true) return TabLoading();
        return TabContent(data: data.nowPlaying);
      },
    );
  }
}
