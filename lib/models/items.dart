import 'package:cloud_firestore/cloud_firestore.dart';

class Items {
  String? itemId;
  String? sellerUID;
  String? itemTitle;
  String? description;
  Timestamp? publishedDate;
  String? status;
  String? itemImageUrl;
  Items({
    this.itemId,
    this.sellerUID,
    this.itemTitle,
    this.description,
    this.publishedDate,
    this.status,
    this.itemImageUrl,
  });

  Items.fromJson(Map<String, dynamic> json) {
    itemId = json['ItemId'];
    sellerUID = json['sellerUID'];
    itemTitle = json['itemTitle'];
    description = json['description'];
    publishedDate = json['publishedDate'];
    status = json['status'];
    itemImageUrl = json['itemImageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["ItemId"] = itemId;
    data["sellerUID"] = sellerUID;
    data["itemTitle"] = itemTitle;
    data["description"] = description;
    data["publishedDate"] = publishedDate;
    data["status"] = status;

    return data;
  }
}
