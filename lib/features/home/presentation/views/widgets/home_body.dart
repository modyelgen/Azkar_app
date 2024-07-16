import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constant.dart';
import 'package:untitled/core/utilities/function/get_basic_prayers.dart';
import 'package:untitled/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:untitled/features/home/presentation/manager/home_cubit/home_states.dart';
import 'package:untitled/features/home/presentation/views/widgets/doaa_of_the_day.dart';
import 'package:untitled/features/home/presentation/views/widgets/get_location.dart';
import 'package:untitled/features/home/presentation/views/widgets/prayer_times.dart';
import 'date_now.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key,});

  @override
  Widget build(BuildContext context) {
    var cubit= BlocProvider.of<HomeCubit>(context);
    return BlocConsumer<HomeCubit,HomeState>(
      builder: (context,state){
        if(cubit.currPrayer!=null && cubit.dateTimeEntity!=null && cubit.enable) {
          return  Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children:  [
                HomeDateBar(dateTimeEntity: cubit.dateTimeEntity!,),
                const  Expanded(child: SizedBox()),
               const GetLocation(),
                const Expanded(child: SizedBox()),
                PrayersTimes(basics: getBasicPrayers(cubit.dateTimeEntity!.azanTimes??{}),),
                const Expanded(child: SizedBox()),
                const DoaaOfTheDay(),
                const Expanded(child: SizedBox()),
              ],
            ),
          );

        }
        else if(state is FailureFetchDuration){
          return Center(child: Text(state.errMessage),);
        }
        else{
          return const Center(child: CircularProgressIndicator(color: mainColor,),);
        }
      },
      listener: (context,state)async{
        if(DateTime.now().hour==23 && DateTime.now().minute==59 && DateTime.now().second==59){

         await cubit.endOfTheDay();
        }
      },

    );
  }
}
