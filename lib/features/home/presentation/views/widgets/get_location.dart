import 'package:flutter/material.dart';
import 'package:untitled/features/home/presentation/views/widgets/location_details_and_pray.dart';
import '../../../../../core/constant.dart';

class GetLocation extends StatelessWidget {
  const GetLocation({super.key});
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: MediaQuery.of(context).size.height*0.16,
      decoration: BoxDecoration(
        color: mainColor,
        borderRadius:BorderRadius.circular(12),
      ),
      child:const DetailsLocationAndPray(),
    );
  }
}