import 'package:flutter/material.dart';

import '../../../../../core/constant.dart';

class AfterFinishingAzkar extends StatelessWidget{
  const AfterFinishingAzkar({super.key,required this.name});
  final String name;
  @override
  Widget build(BuildContext context){
    return   Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const  Text('تقبل الله منا ومنكم ',style: TextStyle(fontSize: 34,fontWeight: FontWeight.bold,color: mainColor),),
        const  SizedBox(height: 20,),
        Text(" لقد انتهيت من  $name",style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
        const SizedBox(height: 10,),
        TextButton(onPressed: (){
          Navigator.pop(context);
        }, child:const Text("العوده لصفحة الاذكار ",style: TextStyle(fontWeight: FontWeight.bold),))

      ],
    );
  }
}