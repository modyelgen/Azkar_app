import 'package:flutter/material.dart';

class PrayItem extends StatelessWidget {
  const PrayItem({super.key,required this.onePrayTime,required this.onePrayName});
final String onePrayTime;
final String onePrayName;
  @override
  Widget build(BuildContext context) {
    return   Row(
      children: [
        Text(onePrayTime),
        const Spacer(),
        Text(onePrayName),

      ],
    );
  }
  // String makeIt(String value){
  //   String va=value;
  //   int x=int.parse(va.substring(0,2));
  //   if(x>12){
  //     x-=12;
  //   }
  //   String time=x.toString();
  //   return time;
  // }
}
