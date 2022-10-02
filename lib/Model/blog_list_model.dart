class BlogListModel {
  List<BlogResult>? result;

  BlogListModel({this.result});

  BlogListModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <BlogResult>[];
      json['result'].forEach((v) {
        result!.add(new BlogResult.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BlogResult {
  int? id;
  String? title;
  String? description;
  String? image;

  BlogResult({this.id, this.title, this.description, this.image});

  BlogResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['image'] = this.image;
    return data;
  }
}
