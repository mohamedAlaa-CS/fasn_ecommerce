import 'package:dartz/dartz.dart';
import 'package:fasn_ecommerce/features/home/data/models/home_model/product_model.dart';

import '../../../../core/errors/failuer.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<ProductModel>>> getSearchData(
      {required String text});
}
