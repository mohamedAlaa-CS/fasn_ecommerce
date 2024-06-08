import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fasn_ecommerce/core/Api/api_services.dart';
import 'package:fasn_ecommerce/core/Api/end_point.dart';
import 'package:fasn_ecommerce/core/errors/failuer.dart';
import 'package:fasn_ecommerce/features/auth/data/models/usermodel/usermodel.dart';
import 'package:fasn_ecommerce/features/more_page/data/repos/profile_repo.dart';

class ProfilRepoImple extends ProfileRepo {
  @override
  Future<Either<Failure, Usermodel>> getProfile() async {
    try {
      Map<String, dynamic> response = await ApiServices.get(
        endPoint: EndPoint.profile,
        isAuth: true,
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
  Future<Either<Failure, Usermodel>> updateProfile({
    required String name,
    required String phone,
    required String email,
    required String password,
    dynamic image,
  }) async {
    try {
      Map<String, dynamic> response = await ApiServices.put(
        endPoint: EndPoint.updateProfile,
        isAuth: true,
        data: {
          'name': name,
          'phone': phone,
          'email': email,
          'password': password,
        // 'image': image
        },
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
