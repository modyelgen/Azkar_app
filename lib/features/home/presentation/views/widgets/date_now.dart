import 'package:flutter/material.dart';
import '../../../../../core/constant.dart';
import 'package:untitled/features/home/domain/entites/azan_entity.dart';
class HomeDateBar extends StatelessWidget {
  const HomeDateBar({super.key,required this.dateTimeEntity});
final DateTimeEntity dateTimeEntity;
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: MediaQuery.of(context).size.height*0.08,
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(dateTimeEntity.readableDate??"",style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
          Text("${dateTimeEntity.hijriDay??""} ${dateTimeEntity.hijriMonth??""} ${dateTimeEntity.hijriYear??""} ",style:const TextStyle(color: mainColor,fontSize: 18,fontWeight: FontWeight.bold),),
        ],
      ),

    );
  }
}
