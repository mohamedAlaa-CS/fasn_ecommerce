import 'package:fasn_ecommerce/features/auth/data/models/usermodel/usermodel.dart';
import 'package:fasn_ecommerce/features/auth/data/repos/auth_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(AuthInitial());
  final AuthRepo authRepo;
//?   
  static AuthCubit get(context) => BlocProvider.of(context);
  GlobalKey loginFormKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
//? signup
  GlobalKey signupFormKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController1 = TextEditingController();
  TextEditingController passwordController1 = TextEditingController();

  Usermodel? userModel;
//! login ========
  Future<void> login() async {
    emit(AuthLoginLoading());
    var result = await authRepo.login(
        email: emailController.text, password: passwordController.text);

    result.fold((error) {
      emit(AuthLoginFailed(error.message));
    }, (userModel) {
      emit(AuthLoginSuccess());
      this.userModel = userModel;
    });
  }
//! signup =======
  Future<void> signup() async {
    emit(AuthSignupLoading());
    var result = await authRepo.signup(
      email: emailController1.text,
      password: passwordController1.text,
      name: nameController.text,
      phone: phoneController.text,
    );

    result.fold((error) {
      emit(AuthSignupFailed(error.message));
    }, (userModel) {
      emit(AuthSignupSuccess());
      this.userModel = userModel;
    });
  }
}
