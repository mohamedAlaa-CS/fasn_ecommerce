import 'package:dartz/dartz.dart';
import 'package:fasn_ecommerce/core/errors/failuer.dart';
import 'package:fasn_ecommerce/features/more_page/data/models/about_us_model.dart';
import 'package:fasn_ecommerce/features/more_page/data/models/common_question_model.dart';

abstract class MorePageRepo {
  Future<Either<Failure, List<CommonQuestionModel>>> getCommonQuestionData();
  Future<Either<Failure, AboutUsModel>> getAboutUsData();
  Future<Either<Failure, String>> getComplaintsAndSuggestion({
    required String name,
    required String email,
    required String phone,
    required String message,

  });
}
