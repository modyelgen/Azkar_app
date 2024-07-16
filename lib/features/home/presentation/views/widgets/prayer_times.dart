import 'package:flutter/material.dart';
import 'package:untitled/features/home/presentation/views/widgets/prayer_item.dart';
import '../../../../../core/constant.dart';

class PrayersTimes extends StatelessWidget {
  const PrayersTimes({super.key,required this.basics});
 final Map<String,dynamic>basics;
  @override
  Widget build(BuildContext context) {
    return   Stack(
       alignment: Alignment.topRight,
       children: [
         Container(
           height: MediaQuery.of(context).size.height*0.37,
           decoration: BoxDecoration(
             color: Colors.white,
             borderRadius: BorderRadius.circular(8),
           ),
           child: Padding(
               padding:  EdgeInsets.only(top:MediaQuery.of(context).size.height*0.35*0.22,right: 15,left: 15),
               child:  SizedBox(
                 height:MediaQuery.of(context).size.height*0.35*0.82,
                 child: ListView.builder(
                   physics:const BouncingScrollPhysics(),
                   shrinkWrap: true,
                   itemBuilder: (context,index){
                     return SizedBox(
                         height:(MediaQuery.of(context).size.height*0.35*0.82)/6,
                         child:  PrayItem(onePrayTime:basics.keys.elementAt(index),onePrayName: basics.values.elementAt(index),));
                   },
                   itemCount: basics.length,
                 ),
               )
           ),
         ),

         Container(
           width: MediaQuery.of(context).size.width*0.38,
           height: MediaQuery.of(context).size.height*0.35*0.18,
           decoration: const BoxDecoration(
               color: mainColor,
               borderRadius: BorderRadius.only(
                 topRight: Radius.circular(8),
                 bottomLeft: Radius.circular(8),
               )
           ),
           child:const Padding(
             padding:  EdgeInsets.symmetric(horizontal: 14.0),
             child:  Row(
               children: [
                 Text("مواعيد الصلاة",style: TextStyle(color: Colors.white),),
                 Spacer(),
                 Icon(Icons.mosque_outlined,color: Colors.white,),
               ],
             ),
           ),
         ),

       ],
     );
  }
}
