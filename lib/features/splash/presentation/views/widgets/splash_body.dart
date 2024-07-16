import 'package:flutter/material.dart';

import '../../../../../core/utilities/assets.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({super.key,});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(splashImage,height: MediaQuery.of(context).size.height*0.5,fit: BoxFit.cover,),
            SizedBox(height:MediaQuery.of(context).size.height*0.07,),
            const Text("فاذكروني أذكركم ",style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold,fontFamily:"Basmellah",))
          ],
        ),
      ),
    );
  }
}
