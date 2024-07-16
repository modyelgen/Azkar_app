import 'package:flutter/material.dart';
import 'package:untitled/features/azkar/presentation/manager/azkar_cubit/azkar_cubit.dart';
import 'package:untitled/features/azkar/presentation/views/widgets/zekr_item.dart';

import '../../../data/model/azkar_model.dart';

class MorningAndNightAzkar extends StatelessWidget {
  const MorningAndNightAzkar({super.key,required this.morningAndNightAzkar});
 final List<AzkarModel>morningAndNightAzkar;

  @override
  Widget build(BuildContext context) {
    return  GridView.builder(
      itemCount: morningAndNightAzkar.length,
      physics:const BouncingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: MediaQuery.of(context).size.width*0.1),
      itemBuilder: (context,index)=>ZekrItem(azkarModel: morningAndNightAzkar[index]));
  }
}