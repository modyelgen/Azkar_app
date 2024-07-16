import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled/features/seb7a/data/manager/sebha_cubit.dart';
import 'package:untitled/features/seb7a/data/manager/sebha_state.dart';
import 'package:untitled/features/seb7a/presentation/view_model/sebha_counter.dart';
import '../../../../../core/constant.dart';
class BeadsItem extends StatelessWidget {
const  BeadsItem({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SebhaCubit,SebhaState>(
      builder: (context,state){
        var cubit=BlocProvider.of<SebhaCubit>(context);
        return SizedBox(
          height: MediaQuery.of(context).size.height*0.5,
          child:  Column(
            children: [
              GestureDetector(
                onTap:cubit.percent<0.01?(){}:()async{
                  cubit.changeCounter();
                  cubit.changePercent();
                },
                child: SebhaCounter(percent: cubit.percent, counter: cubit.counter),
              ),
              const  SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:[
                  CircleAvatar(backgroundColor: Colors.white,radius: 20,child: IconButton(onPressed: (){cubit.resetCounter();}, icon: const Icon(FontAwesomeIcons.rotateRight,color: mainColor,))),
                ] ,
              )
            ],
          ),
        );
      },
    );
  }

}




