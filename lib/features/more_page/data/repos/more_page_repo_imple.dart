import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fasn_ecommerce/core/Api/api_services.dart';
import 'package:fasn_ecommerce/core/Api/end_point.dart';
import 'package:fasn_ecommerce/core/errors/failuer.dart';
import 'package:fasn_ecommerce/features/more_page/data/models/about_us_model.dart';
import 'package:fasn_ecommerce/features/more_page/data/models/common_question_model.dart';
import 'package:fasn_ecommerce/features/more_page/data/repos/more_page_repo.dart';

class MorePageRepoImple implements MorePageRepo {
  @override
  Future<Either<Failure, List<CommonQuestionModel>>>
      getCommonQuestionData() async {
    try {
      Map<String, dynamic> response = await ApiServices.get(
          endPoint: EndPoint.commonQuestion, isAuth: false);

      List<CommonQuestionModel> commonQuestionList = [];

      for (var item in response['data']['data']) {
        commonQuestionList.add(CommonQuestionModel.fromJson(item));
      }

      return Right(commonQuestionList);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDiorError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AboutUsModel>> getAboutUsData() async {
    try {
      Map<String, dynamic> response = await ApiServices.get(
        endPoint: EndPoint.aboutUs,
        isAuth: false,
      );
      AboutUsModel aboutUsModel = AboutUsModel.fromJson(response['data']);
      return Right(aboutUsModel);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDiorError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> getComplaintsAndSuggestion({
    required String name,
    required String email,
    required String phone,
    required String message,
  }) async {
    try {
      Map<String, dynamic> response = await ApiServices.post(
        endPoint: EndPoint.complaintsAndSuggestions,
        isAuth: false,
        data: {
          'name': name,
          'phone': phone,
          'email': email,
          'message': message,
        },
      );
      return Right(response['message']);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDiorError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
