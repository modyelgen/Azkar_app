import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../../../core/constant.dart';

class SebhaCounter extends StatelessWidget {
  const SebhaCounter({super.key,required this.percent,required this.counter});
  final double percent;
  final int counter;
  @override
  Widget build(BuildContext context) {

    return CircularPercentIndicator(
      radius: MediaQuery.of(context).size.height*0.17,lineWidth: MediaQuery.of(context).size.height*0.02,percent: percent,
      backgroundColor: mainColor,
      progressColor: Colors.white,
      center:CircleAvatar(
        backgroundColor:mainColor,
        radius:MediaQuery.of(context).size.height*0.15,
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children:
          [
            Text("$counter",style:const  TextStyle(color: Colors.white,fontSize: 50,fontWeight: FontWeight.bold),),
            SizedBox(height: MediaQuery.of(context).size.height*0.06,),
            const Text("سبح",style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.bold),),
          ],
        ),
      ), );
  }
}