import 'package:flutter/material.dart';

import '../../../../../core/constant.dart';
import '../../../data/model/details_model.dart';

class ZekrItemAndCounter extends StatelessWidget {
  const ZekrItemAndCounter({super.key,required this.model});
  final DetailsModel model;
  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        model.category!=null ?Text(model.category.toString(),textDirection: TextDirection.rtl,style: const TextStyle(color: mainColor,fontWeight: FontWeight.bold,fontSize: 18),):const SizedBox(),
        const  SizedBox(height: 5,),
        Text(model.zekr.toString(),textDirection: TextDirection.rtl,style:const TextStyle(fontSize: 25,height: 1.5),),
        const  SizedBox(height: 5,),
        Text(model.description.toString(),textDirection: TextDirection.rtl,style: const TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),),
        const   SizedBox(height: 5,),
       model.count==0?const SizedBox():Container(
          height: MediaQuery.of(context).size.height*.08,
          width: double.infinity,
          decoration: BoxDecoration(
            color: mainColor,
            borderRadius:BorderRadius.circular(7),
          ),
          child:Center(child:  Text("${model.count!}",style: const TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold),),
          ),
        ),
      ],
    );
  }
}
