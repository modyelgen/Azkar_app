import 'package:flutter/material.dart';
import '../../../../../core/constant.dart';
import 'package:untitled/features/azkar/data/model/azkar_model.dart';
import 'package:untitled/features/azkar/presentation/views/widgets/reading_azkar.dart';
class ZekrItem extends StatelessWidget {
  const ZekrItem({super.key,required this.azkarModel});
  final AzkarModel azkarModel;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ReadingAzkar(detailsModel: azkarModel.detailsModel??[], name: azkarModel.name??"" ,)));
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12.0),
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height*0.18,width: double.infinity,
              child:ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: azkarModel.image==null? Container(decoration:const BoxDecoration(color: mainColor),):Image.asset(azkarModel.image!,fit: BoxFit.fill,width: MediaQuery.of(context).size.width*0.4,)),
            ),
             Container(decoration: const BoxDecoration(color: mainColor),child: Text("${azkarModel.name}",style:const TextStyle(color: Colors.white,fontSize: 16),textDirection: TextDirection.rtl,))
          ],
        ),
      ),
    );
  }
}