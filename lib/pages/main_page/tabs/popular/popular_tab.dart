import 'package:flutter/material.dart';
import 'package:movies_app/pages/main_page/tabs/tab_content.dart';
import 'package:movies_app/widgets/loading/tab_loading.dart';
import 'package:movies_app/provider/popular_provider.dart';
import 'package:provider/provider.dart';

class Popular extends StatelessWidget {
  const Popular({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PopularProvider>(
      builder: (context, data, child) {
        if (data.isLoading == true) return TabLoading();
        return TabContent(data: data.popular);
      },
    );
  }
}
