import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/features/azkar/presentation/manager/azkar_cubit/azkar_cubit.dart';
import 'package:untitled/features/azkar/presentation/manager/azkar_cubit/azkar_state.dart';
import 'package:untitled/features/azkar/presentation/views/widgets/azkar_body.dart';

import '../../../../core/constant.dart';

class AzkarView extends StatelessWidget {
  const AzkarView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>AzkarCubit()..getAzkar(context),
      child: BlocBuilder<AzkarCubit,AzkarState>(
        builder: (context,state){
          var cubit=BlocProvider.of<AzkarCubit>(context);
          if(state is SuccessFetchAzkarState){
            return  SafeArea(
              child:  Scaffold(
                body: Padding(
                    padding: const EdgeInsets.all(16),
                    child: AzkarBody(list:cubit.azkarList!,)
                ),
              ),
            );
          }
          else if( state is FailureFetchAzkarState){
            return Center(child: Text(state.errMessage),);

          }
          else{
            return const Center(child: CircularProgressIndicator(color: mainColor,),);

          }
        },
      ),
    );
  }
}



