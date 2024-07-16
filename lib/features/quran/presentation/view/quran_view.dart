import 'package:flutter/material.dart';

import '../../../../core/constant.dart';

class PageQuran extends StatelessWidget {
  const PageQuran({super.key});

  @override
  Widget build(BuildContext context) {
    final controller= PageController(
        initialPage: 0
    );
    return Scaffold(
      body: PageView.builder(
          reverse: true,
          controller: controller,
          scrollDirection: Axis.horizontal,
          itemCount: listOfColors.length,
          physics:const BouncingScrollPhysics(),
          itemBuilder: (context,index){
            return listOfColors[index];
          }),
    );
  }
}