import 'package:flutter/material.dart';
import 'package:untitled/features/azkar/presentation/views/widgets/azkar_list.dart';
import '../../../data/model/azkar_model.dart';
class AzkarBody extends StatelessWidget {
  const AzkarBody({super.key,required this.list});
  final List<AzkarModel>list;
  @override
  Widget build(BuildContext context) {
    return  Column(
      children:[
        const SizedBox(height: 30,),
        const  Align(alignment: Alignment.center,child: Text("الأذكار ",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),)),
        const SizedBox(height: 30,),
        SizedBox(
            height: MediaQuery.of(context).size.height*0.22,
            child: MorningAndNightAzkar(morningAndNightAzkar: list.sublist(0,2),)
        ),
        const SizedBox(height: 14,),
        const  Align(alignment: Alignment.centerRight,child: Text("أذكار متنوعة ",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),)),
        const SizedBox(height: 10,),
        Expanded(
          child:  SizedBox(
            child:  MorningAndNightAzkar(morningAndNightAzkar: list.sublist(2),),
          ),
        ),
        const SizedBox(height: 10,)
      ],
    );
  }
}
