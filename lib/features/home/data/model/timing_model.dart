class Date{
  String?readableDate;
  String?hijriDay;
  String?hijriDayName;
  String?hijriMonthEn;
  String?hijriMonthAr;
  String?hijriYear;
  Date({required this.hijriDay,required this.hijriMonthEn,required this.hijriMonthAr,required this.readableDate,required this.hijriDayName,required this.hijriYear});

  factory Date.fromJson(Map<String,dynamic>json)=>Date(
    hijriDay:     json['hijri']['day'],
    hijriDayName: json['hijri']['weekday']['ar'],
    hijriMonthEn: json['hijri']['month']['en'],
    hijriMonthAr: json['hijri']['month']['ar'],
    readableDate: json['readable'],
    hijriYear: json['hijri']['year'],
  );

}