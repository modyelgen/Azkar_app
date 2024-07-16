import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/core/utilities/shared_pref.dart';
import 'package:untitled/features/seb7a/data/manager/sebha_cubit.dart';
import '../view_model/beads_item.dart';
class BeadsView extends StatelessWidget {
const BeadsView({super.key});
  @override
  Widget build(BuildContext context) {
   return  BlocProvider (
     create: (context)  {
       return SebhaCubit(CachedDateSharedPreferences());
     },
     child: SafeArea(
         child: Scaffold(
             body:Column(
               children: [
                 SizedBox(height: MediaQuery.of(context).size.height*0.03,),
                 const Center(child: Text("السبحة الالكترونية",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),textDirection: TextDirection.rtl,)),
                 const  Expanded(child: SizedBox()),
                 const BeadsItem(),
                 const  Expanded(child: SizedBox()),
               ],
             )
         )
     ),
   );
  }
}


