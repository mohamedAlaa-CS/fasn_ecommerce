import 'package:dartz/dartz.dart';
import 'package:fasn_ecommerce/core/errors/failuer.dart';
import 'package:fasn_ecommerce/features/more_page/data/models/get_oreders_model.dart';
import 'package:fasn_ecommerce/features/more_page/data/models/oreder_details_model/oreder_details_model.dart';

abstract class OrderRepo {
  Future<Either<Failure, List<GetOredersModel>>> getMyOrders();
  Future<Either<Failure, OrederDetailsModel>> getOrderDetails({ required int orderId});
}
