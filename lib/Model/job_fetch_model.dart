class JobListModel {
  List<JobData>? data;

  JobListModel({this.data});

  JobListModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <JobData>[];
      json['data'].forEach((v) {
        data!.add(JobData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class JobData {
  int? id;
  String? title;
  String? description;
  int? price;
  String? hour;
  int? userid;
  String? ngoName;

  JobData(
      {this.id,
        this.title,
        this.description,
        this.price,
        this.hour,
        this.userid,
        this.ngoName});

  JobData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    price = json['price'];
    hour = json['hour'];
    userid = json['userid'];
    ngoName = json['ngo_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['price'] = this.price;
    data['hour'] = this.hour;
    data['userid'] = this.userid;
    data['ngo_name'] = this.ngoName;
    return data;
  }
}
