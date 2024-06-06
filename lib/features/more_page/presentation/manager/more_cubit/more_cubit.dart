import 'package:fasn_ecommerce/core/helper/functions/show_snack_bar.dart';
import 'package:fasn_ecommerce/features/more_page/data/models/about_us_model.dart';
import 'package:fasn_ecommerce/features/more_page/data/models/common_question_model.dart';
import 'package:fasn_ecommerce/features/more_page/data/repos/more_page_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'more_state.dart';

class MoreCubit extends Cubit<MoreState> {
  MoreCubit(this.morePageRepo) : super(MoreInitial());
  final MorePageRepo morePageRepo;
  static MoreCubit get(context) => BlocProvider.of(context);
  bool settingIsShow = false;

  changeSettingIsShow() {
    settingIsShow = !settingIsShow;
    emit(MoreChangeSettingIsShow());
  }

//! get common question data ===========
  List<CommonQuestionModel> commonQuestionList = [];
  getCommonQuestion() async {
    emit(MoreGetCommonQuestionLoading());
    var result = await morePageRepo.getCommonQuestionData();
    result.fold((error) {
      emit(MoreGetCommonQuestionFailed());
    }, (success) {
      emit(MoreGetCommonQuestionSuccess());
      commonQuestionList = success;
    });
  }

//! get about us data ===========
  AboutUsModel? aboutUsModel;
  getAboutAu() async {
    emit(MoreGetAboutUsLoading());
    var result = await morePageRepo.getAboutUsData();
    result.fold((error) {
      emit(MoreGetAboutUsFailed());
    }, (success) {
      emit(MoreGetAboutUsSuccess());
      aboutUsModel = success;
    });
  }

  //! get complaint and suggestion data ===========
  GlobalKey<FormState> complaintsFormKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  getComplaintAndSuggestion() async {
    emit(MoreGetComplaintAndSuggestionLoading());
    var result = await morePageRepo.getComplaintsAndSuggestion(
      name: nameController.text,
      email: emailController.text,
      phone: phoneController.text,
      message: messageController.text,
    );
    result.fold((error) {
      emit(MoreGetComplaintAndSuggestionFailed());
      showSnackbar(error.message, error: true);
    }, (success) {
      emit(MoreGetComplaintAndSuggestionSuccess());
      showSnackbar(success);
    });
  }

  tryComplaintAndSuggestion() {
    if (complaintsFormKey.currentState!.validate()) {
      getComplaintAndSuggestion();
    }
  }
}
