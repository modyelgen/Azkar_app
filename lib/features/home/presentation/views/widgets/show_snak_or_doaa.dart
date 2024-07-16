import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';
import '../../../../../core/constant.dart';
class ShowSnackOrDoaa extends StatelessWidget {
  const ShowSnackOrDoaa({super.key,required this.snake,required this.doaa});
  final bool snake;
  final String doaa;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        snake ?const SizedBox():Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: mainColor
          ),
          width: MediaQuery.of(context).size.width*0.25,
          height: MediaQuery.of(context).size.height*0.04,
          child: Row(children: [
            IconButton(onPressed: (){
              debugPrint('share pressed');
              shareMessage(doaa);
            }, icon:const Icon( Icons.share,color: Colors.white,)),
            const Spacer(),
            IconButton(onPressed: ()async{
              debugPrint('clip pressed');
              Clipboard.setData(ClipboardData(text: doaa));
              ScaffoldMessenger.of(context).showSnackBar(copySnackBar);
            }, icon: const Icon(Icons.copy,color: Colors.white)),
          ],),),
        const Spacer(),
        const  Text("دعاء اليوم",style: TextStyle(color: mainColor),textDirection:TextDirection.rtl,),
      ],
    );
  }
  void shareMessage(final String message){
    Share.share(message);
  }
}
