import 'package:fasn_ecommerce/core/utils/local_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());
  static MainCubit get(context) => BlocProvider.of(context);
  String currentLanguage = 'en';

  changeLanguage(String lang) {
    currentLanguage = lang;
    LocalData.saveString('myLanguage', lang);
    emit(MainChangeLanguageState());
  }

}
