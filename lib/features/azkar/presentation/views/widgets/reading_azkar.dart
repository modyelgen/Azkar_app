import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constant.dart';
import 'package:untitled/features/azkar/data/model/details_model.dart';
import 'package:untitled/features/azkar/presentation/manager/azkar_cubit/azkar_cubit.dart';
import 'package:untitled/features/azkar/presentation/manager/azkar_cubit/azkar_state.dart';
import 'package:untitled/features/azkar/presentation/views/widgets/after_finish_azkar.dart';
import 'package:untitled/features/azkar/presentation/views/widgets/one_zekr_details.dart';

class ReadingAzkar extends StatelessWidget {
 const  ReadingAzkar({super.key,required this.detailsModel,required this.name});
final List<DetailsModel> detailsModel;
final String name;
 @override
  Widget build(BuildContext context) {
   return BlocProvider(
     create: (context)=>AzkarCubit(),
     child: BlocBuilder<AzkarCubit,AzkarState>(builder: (context,state){
       var cubit=BlocProvider.of<AzkarCubit>(context);
       return  SafeArea(
         child: Scaffold(
           appBar: AppBar(
           backgroundColor: mainColor,
           title: Text(name),
           centerTitle: true,
         ),
           body: cubit.show? Padding(
              padding: const EdgeInsets.all(15.0),
                child:ListView.separated(
                    physics:const BouncingScrollPhysics(),
                    itemBuilder: (context,index){
                      return GestureDetector(
                          onTap: detailsModel[index].count!=0?(){
                            checkAndReduce(index, cubit);
                            cubit.showFinishing(detailsModel.length);}:(){},
                          child: OneZekrItem(model: detailsModel[index],));
                      },
                    separatorBuilder: (context,index){
                      return const SizedBox(height: 15,);},
                    itemCount: detailsModel.length
                ),
       ):
           Center(child: AfterFinishingAzkar(name: name)),),);
     }),
   );}
 void checkAndReduce(int index, AzkarCubit cubit) {
   detailsModel[index].count=cubit.reduceCount(detailsModel[index].count??0);
   if(detailsModel[index].count==0) {
     detailsModel.removeAt(index);
     cubit.removeCounter();
   }
 }
}



