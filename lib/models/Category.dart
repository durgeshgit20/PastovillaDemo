class Category {
  String id;
  String categoryName;
  String imgUrl;

  Category({this.id, this.categoryName, this.imgUrl});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryName = json['category_name'];
    imgUrl = json['imgUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_name'] = this.categoryName;
    data['imgUrl'] = this.imgUrl;
    return data;
  }
}
