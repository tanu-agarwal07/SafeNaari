class SosListModel {
  List<SosResult>? result;

  SosListModel({this.result});

  SosListModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <SosResult>[];
      json['result'].forEach((v) {
        result!.add(SosResult.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SosResult {
  int? id;
  String? name;
  int? mobile;
  int? userid;

  SosResult({this.id, this.name, this.mobile, this.userid});

  SosResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    mobile = json['mobile'];
    userid = json['userid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['mobile'] = this.mobile;
    data['userid'] = this.userid;
    return data;
  }
}
