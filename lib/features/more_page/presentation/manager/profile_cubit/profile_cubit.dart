import 'dart:io';

import 'package:fasn_ecommerce/core/helper/functions/set_image.dart';
import 'package:fasn_ecommerce/core/router/app_router.dart';
import 'package:fasn_ecommerce/core/utils/app_strings.dart';
import 'package:fasn_ecommerce/core/utils/local_data.dart';
import 'package:fasn_ecommerce/features/auth/data/models/usermodel/usermodel.dart';
import 'package:fasn_ecommerce/features/auth/presentation/views/login_view.dart';
import 'package:fasn_ecommerce/features/home/presentaion/manager/main_cubit/main_cubit.dart';
import 'package:fasn_ecommerce/features/more_page/data/repos/profile_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.profileRepo) : super(ProfileInitial()) {
    getProfile();
  }

  final ProfileRepo profileRepo;
  static ProfileCubit get(context) => BlocProvider.of(context);
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isUpdated = false;

  void changeIsUpdated() {
    isUpdated = !isUpdated;
    emit(ChangeIsUpdated());
  }

//! get profile from api ===================
  Usermodel? usermodel;
  Future<void> getProfile() async {
    emit(GetProfileLoading());
    var result = await profileRepo.getProfile();
    result.fold((l) {
      emit(GetProfileFailed());
    }, (success) {
      usermodel = success;
      MainCubit.get(AppNavigator.context).setUser(success);

      nameController.text = success.data!.name!;
      phoneController.text = success.data!.phone!;
      emailController.text = success.data!.email!;
      emit(GetProfileSuccess());
    });
  }

//! update profile ===================
  File? avatar;
  setImage(BuildContext context) async {
    avatar = await pickImage(context);
    emit(SetImageSuccess());
  }

  Future<void> updateProfile() async {
    emit(UpdateProfileLoading());

    var result = await profileRepo.updateProfile(
      name: nameController.text,
      phone: phoneController.text,
      email: emailController.text,
      password: passwordController.text,
      // image: MultipartFile.fromFile(
      //   avatar!.path,
      //   filename: avatar?.path.split('/').last,
      // ),
    );
    result.fold((l) {
      emit(UpdateProfileFailed());
    }, (success) {
      emit(UpdateProfileSuccess());
      getProfile();
      changeIsUpdated();
    });
  }

  Future<void> logOut() async {
    var result = await profileRepo.logOut(token: LocalData.token ?? '');

    result.fold((l) {
      emit(LogOutFailed());
    }, (success) {
      emit(LogOutSuccess());
      Navigator.pop(AppNavigator.context);
      Navigator.of(AppNavigator.context)
          .pushReplacementNamed(LoginPage.routeName);
      LocalData.remove(AppStrings.token);
      MainCubit.get(AppNavigator.context).userModel = null;
    });
  }
}
