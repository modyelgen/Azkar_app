import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slide_countdown/slide_countdown.dart';
import 'package:untitled/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:untitled/features/home/presentation/manager/home_cubit/home_states.dart';
import '../../../../../core/constant.dart';
import 'package:untitled/core/utilities/shared_pref.dart';

class DetailsLocationAndPray extends StatelessWidget {
 const DetailsLocationAndPray({super.key});
 @override
  Widget build(BuildContext context) {
    var cubit=BlocProvider.of<HomeCubit>(context);
    return BlocBuilder<HomeCubit,HomeState>(
        builder: (context,state){
          return Padding(
            padding:  const EdgeInsets.all(12.0),
            child:  Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(Icons.location_on_outlined),
                    Text("${CachedDateSharedPreferences().getData(key: "place")??cubit.placeMark.subAdministrativeArea}"),
                  ],
                ),
                const Expanded(child: SizedBox()),
                const  Align(alignment: Alignment.centerLeft,child:  Text("Remained Time For ")),
                const Expanded(child: SizedBox()),
                Row(
                  children: [
                    Text(cubit.currPrayer??"",style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 27),),
                    const Spacer(),
                    SlideCountdown(
                      onDone: (){
                        cubit.finishDuration();
                        cubit.getDuration();
                      },
                      slideDirection: SlideDirection.none,
                      showZeroValue: true,
                      textStyle: const TextStyle(fontSize: 27,color: Colors.white),
                      duration:cubit.currDuration,
                      decoration: const BoxDecoration(color: mainColor,borderRadius: BorderRadius.zero),
                    ),
                  ],),
                const Expanded(child: SizedBox()),
              ],
            ),
          );
        }
    );
  }
}

