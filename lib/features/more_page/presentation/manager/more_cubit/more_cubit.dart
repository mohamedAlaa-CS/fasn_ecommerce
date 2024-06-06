import 'package:fasn_ecommerce/features/more_page/data/models/about_us_model.dart';
import 'package:fasn_ecommerce/features/more_page/data/models/common_question_model.dart';
import 'package:fasn_ecommerce/features/more_page/data/repos/more_page_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

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
}
