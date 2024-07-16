import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:untitled/features/home/presentation/manager/home_cubit/home_states.dart';
import 'package:untitled/features/home/presentation/views/widgets/show_snak_or_doaa.dart';

class DoaaOfTheDay extends StatelessWidget {
  const DoaaOfTheDay({super.key});
  @override
  Widget build(BuildContext context) {
    int dayOfDate=DateTime.now().day;
    return BlocBuilder<HomeCubit,HomeState>(
      builder: (context,state){
        var cubit=BlocProvider.of<HomeCubit>(context);
        return Container(
          height: MediaQuery.of(context).size.height*0.15,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListView(
            padding:const  EdgeInsets.all(12.0),
            physics:const BouncingScrollPhysics(),
            children: [
              ShowSnackOrDoaa(snake: cubit.snake, doaa: cubit.doaaList[dayOfDate],),
              SizedBox(height: MediaQuery.of(context).size.height*0.15*0.1,),
              InkWell(onLongPress:(){
                cubit.showSnaK();
              },
                  child: Container(padding:const EdgeInsets.all(5),decoration: BoxDecoration(color:cubit.snake?Colors.white:Colors.grey,),child: Text(cubit.doaaList[dayOfDate],textDirection: TextDirection.rtl,))),
              SizedBox(height: MediaQuery.of(context).size.height*0.15*0.1,),
            ],
          ),
        );
      },
    );
  }


}
