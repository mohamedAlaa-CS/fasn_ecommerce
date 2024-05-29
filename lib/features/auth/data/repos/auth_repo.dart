import 'package:dartz/dartz.dart';
import 'package:fasn_ecommerce/core/errors/failuer.dart';
import 'package:fasn_ecommerce/features/auth/data/models/usermodel/usermodel.dart';

abstract class AuthRepo {
  Future<Either<Failure, Usermodel>> login({
    required String email,
    required String password,
  });
  Future<Either<Failure, Usermodel>> signup({
    required String email,
    required String password,
    required String name,
    required String phone,
  });
}
