import 'package:dartz/dartz.dart';
import 'package:fasn_ecommerce/core/errors/failuer.dart';
import 'package:fasn_ecommerce/features/cart/data/models/cart_model/cart_model.dart';

abstract class CartRepo {
  Future<Either<Failure, CartModel>> getCartData();
}
