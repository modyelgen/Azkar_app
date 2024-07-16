class DetailsModel{
  int?count;
  String?category;
  String?description;
  String?reference;
  String? zekr;

  DetailsModel(this.count,this.description,this.reference,this.category,this.zekr);
  DetailsModel.fromJson(Map<String,dynamic>json){
    count=json['count'];
    category=json['category'];
    description=json['description'];
    reference=json['reference'];
    zekr=json['zekr'];
  }
}