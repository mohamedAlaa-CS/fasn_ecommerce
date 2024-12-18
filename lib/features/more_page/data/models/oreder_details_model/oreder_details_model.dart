import 'package:fasn_ecommerce/features/more_page/data/models/oreder_details_model/product.dart';

import 'address.dart';

class OrederDetailsModel {
  num? id;
  num? cost;
  num? discount;
  num? points;
  num? vat;
  num? total;
  num? pointsCommission;
  String? promoCode;
  String? paymentMethod;
  String? date;
  String? status;
  Address? address;
  List<Product>? products;

  OrederDetailsModel({
    this.id,
    this.cost,
    this.discount,
    this.points,
    this.vat,
    this.total,
    this.pointsCommission,
    this.promoCode,
    this.paymentMethod,
    this.date,
    this.status,
    this.address,
    this.products,
  });

  factory OrederDetailsModel.fromJson(Map<String, dynamic> json) {
    return OrederDetailsModel(
      id: json['id'] as num?,
      cost: json['cost'] as num?,
      discount: json['discount'] as num?,
      points: json['points'] as num?,
      vat: json['vat'] as num?,
      total: json['total'] as num?,
      pointsCommission: json['points_commission'] as num?,
      promoCode: json['promo_code'] as String?,
      paymentMethod: json['payment_method'] as String?,
      date: json['date'] as String?,
      status: json['status'] as String?,
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
