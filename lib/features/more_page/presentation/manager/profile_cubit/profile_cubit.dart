import 'dart:io';

import 'package:fasn_ecommerce/core/helper/functions/set_image.dart';
import 'package:fasn_ecommerce/features/auth/data/models/usermodel/usermodel.dart';
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
      MainCubit.getFalse.userModel = success;

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
}
