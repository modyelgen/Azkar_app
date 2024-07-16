import 'package:untitled/features/azkar/data/model/details_model.dart';

class AzkarModel{
  int? id;
  String? name;
  String?image;
 List<DetailsModel>?detailsModel;
  AzkarModel(this.detailsModel,this.id,this.name,this.image);
  AzkarModel.fromJson(Map<String,dynamic>json){
    id = json['id'];
    name = json['name'];
    image = json['image'];
    if (json['details'] != null) {
      detailsModel=<DetailsModel>[];
     json['details'].forEach((value){
       detailsModel!.add(DetailsModel.fromJson(value));
     });
    }
  }
}
