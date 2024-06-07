import 'dart:developer';

import 'package:fasn_ecommerce/features/auth/data/models/usermodel/usermodel.dart';
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

  Usermodel? usermodel;
  Future<void> getProfile() async {
    emit(GetProfileLoading());
    var result = await profileRepo.getProfile();
    result.fold((l) {
      emit(GetProfileFailed());
    }, (success) {
      usermodel = success;
      log(usermodel.toString());
      nameController.text = success.data!.name!;
      phoneController.text = success.data!.phone!;
      emailController.text = success.data!.email!;
      emit(GetProfileSuccess());
    });
  }

  void updateProfile() {}
}
