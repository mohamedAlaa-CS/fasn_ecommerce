import 'cart_item.dart';

class CartModel {
  List<CartItem>? cartItems;
  double? subTotal;
  double? total;

  CartModel({this.cartItems, this.subTotal, this.total});

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        cartItems: (json['cart_items'] as List<dynamic>?)
            ?.map((e) => CartItem.fromJson(e as Map<String, dynamic>))
            .toList(),
        subTotal: (json['sub_total'] as num?)?.toDouble(),
        total: (json['total'] as num?)?.toDouble(),
      );
}
