class Hotels {
  String id;
  String hotelName;
  String address;
  int contactNumber;
  bool isOpen;
  String hotelCategory;
  String price;
  double rating;
  String timing;
  String imgUrl;
  List<Comments> comments;
  List<String> menuAndPhotos;

  Hotels(
      {this.id,
      this.hotelName,
      this.address,
      this.contactNumber,
      this.isOpen,
      this.hotelCategory,
      this.price,
      this.rating,
      this.timing,
      this.imgUrl,
      this.comments,
      this.menuAndPhotos});

  Hotels.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    hotelName = json['hotel_name'];
    address = json['address'];
    contactNumber = json['contact_number'];
    isOpen = json['isOpen'];
    hotelCategory = json['hotel_category'];
    price = json['price'];
    rating = json['rating'];
    timing = json['timing'];
    imgUrl = json['imgUrl'];
    if (json['comments'] != null) {
      comments = new List<Comments>();
      json['comments'].forEach((v) {
        comments.add(new Comments.fromJson(v));
      });
    }
    menuAndPhotos = json['menu_and_photos'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['hotel_name'] = this.hotelName;
    data['address'] = this.address;
    data['contact_number'] = this.contactNumber;
    data['isOpen'] = this.isOpen;
    data['hotel_category'] = this.hotelCategory;
    data['price'] = this.price;
    data['rating'] = this.rating;
    data['timing'] = this.timing;
    data['imgUrl'] = this.imgUrl;
    if (this.comments != null) {
      data['comments'] = this.comments.map((v) => v.toJson()).toList();
    }
    data['menu_and_photos'] = this.menuAndPhotos;
    return data;
  }
}

class Comments {
  String userName;
  String userProfilePic;
  String comment;
  String rating;

  Comments({this.userName, this.userProfilePic, this.comment, this.rating});

  Comments.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    userProfilePic = json['userProfilePic'];
    comment = json['comment'];
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userName'] = this.userName;
    data['userProfilePic'] = this.userProfilePic;
    data['comment'] = this.comment;
    data['rating'] = this.rating;
    return data;
  }
}