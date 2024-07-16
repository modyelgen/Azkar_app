import 'package:flutter/material.dart';
import 'package:untitled/features/azkar/presentation/views/widgets/zekr_item_counter.dart';
import '../../../../../core/constant.dart';
import '../../../data/model/details_model.dart';

class OneZekrItem extends StatelessWidget {
  const OneZekrItem({super.key,required this.model});
  final DetailsModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border:Border.all(color:mainColor)
      ),

      child: Padding(
        padding:const  EdgeInsets.all(15.0),
        child:  ZekrItemAndCounter(model: model),
      ),
    );
  }
}
