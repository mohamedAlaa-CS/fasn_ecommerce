class CartModel {
  int? id;
  String? message;

  CartModel({this.id, this.message});

 factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
    id: json['data']['id'],
    message: json['message'],
  );
}
