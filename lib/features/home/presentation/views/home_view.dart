import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/features/azkar/presentation/views/azkar_view.dart';
import 'package:untitled/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:untitled/features/home/presentation/manager/home_cubit/home_states.dart';
import 'package:untitled/features/home/presentation/views/widgets/home_body.dart';
import 'package:untitled/features/home/presentation/views/widgets/home_nav_bar.dart';
import 'package:untitled/features/seb7a/presentation/views/beads_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const List<Widget>allWidgets=[
    HomeBody(),
    AzkarView(),
    BeadsView(),
  ];

  @override
  Widget build(BuildContext context) {
    int currIndex=0;
     return  BlocBuilder<HomeCubit,HomeState>(
       builder: (context,state){
         void onItemTap(int index){
            currIndex=BlocProvider.of<HomeCubit>(context).changeIndex(index);
         }
         return SafeArea(
             child: Scaffold(
               body:  allWidgets[currIndex],
               bottomNavigationBar: HomeNavBar(onTap: onItemTap,index: currIndex,),

           ),
         );
       },
     );
  }
}





