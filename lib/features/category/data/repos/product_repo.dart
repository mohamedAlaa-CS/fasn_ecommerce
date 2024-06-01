import 'package:dartz/dartz.dart';
import 'package:fasn_ecommerce/core/errors/failuer.dart';
import 'package:fasn_ecommerce/features/category/data/models/cart_model.dart';

abstract class ProductRepo {
  Future<Either<Failure, String>> addToFavorate({
    required int productId,
  });
  Future<Either<Failure, CartModel>> addToCart({
    required int productId,
  });
  Future<Either<Failure, String>> updateQuantity({
    required int productId,
    required int qty,
  });
}
