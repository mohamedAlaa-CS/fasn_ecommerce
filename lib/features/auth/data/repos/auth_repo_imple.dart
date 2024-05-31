import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fasn_ecommerce/core/Api/api_services.dart';
import 'package:fasn_ecommerce/core/Api/end_point.dart';
import 'package:fasn_ecommerce/core/errors/failuer.dart';
import 'package:fasn_ecommerce/features/auth/data/models/usermodel/usermodel.dart';
import 'package:fasn_ecommerce/features/auth/data/repos/auth_repo.dart';

class AuthRepoImple implements AuthRepo {
  @override
  Future<Either<Failure, Usermodel>> login({
    required String email,
    required String password,
  }) async {
    Map<String, dynamic> data = {
      'email': email,
      'password': password,
    };
    try {
      Map<String, dynamic> response = await ApiServices.post(
        endPoint: EndPoint.login,
        data: data,
        isAuth: false,
      );

      return Right(Usermodel.fromJson(response));
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDiorError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Usermodel>> signup({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) async {
    Map<String, dynamic> data = {
      'email': email,
      'password': password,
      'name': name,
      'phone': phone,
    };
    try {
      Map<String, dynamic> response = await ApiServices.post(
        endPoint: EndPoint.signup,
        data: data,
        isAuth: false,
      );

      return Right(Usermodel.fromJson(response));
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDiorError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
