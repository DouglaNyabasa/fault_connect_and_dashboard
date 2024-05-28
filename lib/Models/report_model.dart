
class FaultModel  {
  int? id;
  String? details;
  String? faultCategories;
  String? dateTime;
  String? status;
  String? image;
  String? location;
  String? recipient;

  FaultModel({
  this.id,
  this.details,
  this.faultCategories,
  this.dateTime,
  this.status,
  this.image,
  this.location,
  this.recipient,
  });


  FaultModel.fromJson(Map<String, dynamic> json) {
  id = json['id'];
  details = json['details'];
  faultCategories = json['faultCategories'];
  dateTime = json['dateTime'];
  status = json['status'];
  image = json['image'];
  location = json['location'];
  recipient = json['recipient'];
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = id;
  data['details'] = details;
  data['faultCategories'] = faultCategories;
  data['dateTime'] = dateTime;
  data['status'] = status;
  data['image'] = image;
  data['location'] = location;
  data['recipient'] = recipient;
  return data;
  }
  }