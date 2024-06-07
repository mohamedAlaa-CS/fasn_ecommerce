import 'package:dartz/dartz.dart';
import 'package:fasn_ecommerce/core/errors/failuer.dart';
import 'package:fasn_ecommerce/features/auth/data/models/usermodel/usermodel.dart';

abstract class ProfileRepo {
  Future<Either<Failure, Usermodel>> getProfile();

  Future<Either<Failure, Usermodel>> updateProfile({
    required String name,
    required String phone,
    required String email,
    required String password,
    required String image,
  });
}
