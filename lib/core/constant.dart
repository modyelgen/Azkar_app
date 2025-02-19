import 'package:flutter/material.dart';
const Color mainColor=Color(0xff8da05e);
Color backGroundQuran=const Color(0xff8da05e).withOpacity(0.2);

const String azanBox="AzanBox";
Map<String,dynamic>basicPrayers={
  "Fajr": null,
  "Sunrise": null,
  "Dhuhr": null,
  "Asr": null,
  "Maghrib": null,
  "Isha": null,
};
Map<String,dynamic>basicAzanPrayers={
  "Fajr": null,
  "Dhuhr": null,
  "Asr": null,
  "Maghrib": null,
  "Isha": null,
};
const  copySnackBar=SnackBar(
  content: Text('copied to clipboard',style: TextStyle(color:Colors.white),)
);
List<Widget>listOfColors=[
  Container(
    padding:const EdgeInsets.all(20),
    color: backGroundQuran,
    child:const Text(text,textDirection: TextDirection.rtl,style: TextStyle(height: 1.5,fontWeight: FontWeight.bold,fontSize: 20)),
  ),
  Container(
    color: Colors.teal,
  ),
  Container(
    color: Colors.black,
  ),

];
const String text='إِنَّ ٱلَّذِينَ كَفَرُوا سَوَآءٌ عَلَيْهِمْ ءَأَنذَرْتَهُمْ أَمْ لَمْ تُنذِرْهُمْ لَا يُؤْمِنُونَ ﴿٦﴾ خَتَمَ ٱللَّهُ عَلَىٰ قُلُوبِهِمْ وَعَلَىٰ سَمْعِهِمْ ۖ وَعَلَىٰٓ أَبْصَٰرِهِمْ غِشَٰوَةٌ ۖ وَلَهُمْ عَذَابٌ عَظِيمٌ ﴿٧﴾ وَمِنَ ٱلنَّاسِ مَن يَقُولُ ءَامَنَّا بِٱللَّهِ وَبِٱلْيَوْمِ ٱلْءَاخِرِ وَمَا هُم بِمُؤْمِنِينَ ﴿٨﴾ يُخَٰدِعُونَ ٱللَّهَ وَٱلَّذِينَ ءَامَنُوا وَمَا يَخْدَعُونَ إِلَّآ أَنفُسَهُمْ وَمَا يَشْعُرُونَ ﴿٩﴾ فِى قُلُوبِهِم مَّرَضٌ فَزَادَهُمُ ٱللَّهُ مَرَضًا ۖ وَلَهُمْ عَذَابٌ أَلِيمٌۢ بِمَا كَانُوا يَكْذِبُونَ ﴿١٠﴾ وَإِذَا قِيلَ لَهُمْ لَا تُفْسِدُوا فِى ٱلْأَرْضِ قَالُوٓا إِنَّمَا نَحْنُ مُصْلِحُونَ ﴿١١﴾ أَلَآ إِنَّهُمْ هُمُ ٱلْمُفْسِدُونَ وَلَٰكِن لَّا يَشْعُرُونَ ﴿١٢﴾ وَإِذَا قِيلَ لَهُمْ ءَامِنُوا كَمَآ ءَامَنَ ٱلنَّاسُ قَالُوٓا أَنُؤْمِنُ كَمَآ ءَامَنَ ٱلسُّفَهَآءُ ۗ أَلَآ إِنَّهُمْ هُمُ ٱلسُّفَهَآءُ وَلَٰكِن لَّا يَعْلَمُونَ ﴿١٣﴾ وَإِذَا لَقُوا ٱلَّذِينَ ءَامَنُوا قَالُوٓا ءَامَنَّا وَإِذَا خَلَوْا إِلَىٰ شَيَٰطِينِهِمْ قَالُوٓا إِنَّا مَعَكُمْ إِنَّمَا نَحْنُ مُسْتَهْزِءُونَ ﴿١٤﴾ ٱللَّهُ يَسْتَهْزِئُ بِهِمْ وَيَمُدُّهُمْ فِى طُغْيَٰنِهِمْ يَعْمَهُونَ ﴿١٥﴾ أُولَٰٓئِكَ ٱلَّذِينَ ٱشْتَرَوُا ٱلضَّلَٰلَةَ بِٱلْهُدَىٰ فَمَا رَبِحَت تِّجَٰرَتُهُمْ وَمَا كَانُوا مُهْتَدِينَ ﴿١٦﴾';