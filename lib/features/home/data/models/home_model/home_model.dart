import 'package:fasn_ecommerce/features/home/data/models/home_model/banner_model.dart';
import 'package:fasn_ecommerce/features/home/data/models/home_model/product_model.dart';

class HomeModel {
  List<BannerModel>? banners;
  List<ProductModel>? products;

  HomeModel({this.banners, this.products});

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        banners: (json['banners'] as List<dynamic>?)
            ?.map((e) => BannerModel.fromJson(e as Map<String, dynamic>))
            .toList(),
        products: (json['products'] as List<dynamic>?)
            ?.map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
}
