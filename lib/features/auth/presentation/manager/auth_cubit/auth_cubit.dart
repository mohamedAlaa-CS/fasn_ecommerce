import 'package:fasn_ecommerce/features/auth/data/models/usermodel/usermodel.dart';
import 'package:fasn_ecommerce/features/auth/data/repos/auth_repo.dart';
import 'package:fasn_ecommerce/features/home/presentaion/manager/main_cubit/main_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(AuthInitial());
  final AuthRepo authRepo;
//?
  static AuthCubit get(context) => BlocProvider.of(context);
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
//? signup
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController1 = TextEditingController();
  TextEditingController passwordController1 = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();

  Usermodel? userModel;
//! login ========
  Future<void> login() async {
    emit(AuthLoginLoading());
    var result = await authRepo.login(
        email: emailController.text, password: passwordController.text);

    result.fold((error) {
      emit(AuthLoginFailed(error.message));
    }, (userModel) {
      emit(AuthLoginSuccess(userModel));
      this.userModel = userModel;
      MainCubit.getFalse.userModel = userModel;
    });
  }

  tryLogin() async {
    if (loginFormKey.currentState!.validate()) {
      return await login();
    }
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;
  void changeVisablityPassword() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(LoginChangeVisabilityPasswordState());
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
      emit(AuthSignupSuccess(userModel));
      this.userModel = userModel;
    });
  }

//! try signup
  Future<void> trySignup() async {
    if (signupFormKey.currentState!.validate()) {
      return await signup();
    }
  }

  IconData signupSuffix = Icons.visibility_outlined;
  bool signupIsPassword = true;
  void changeVisablitySignupPassword() {
    signupIsPassword = !signupIsPassword;
    signupSuffix = signupIsPassword
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined;

    emit(SignupChangeVisabilityPasswordState());
  }
}
