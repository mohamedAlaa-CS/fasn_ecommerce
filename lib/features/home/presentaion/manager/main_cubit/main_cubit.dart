import 'package:fasn_ecommerce/core/utils/local_data.dart';
import 'package:fasn_ecommerce/core/widgets/main_text.dart';
import 'package:fasn_ecommerce/features/home/presentaion/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());
  static MainCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget> screens = [
    const HomeView(),
    const Center(child: MainText('Search')),
    const Center(child: MainText('Cart')),
    const Center(child: MainText('Love')),
    const Center(child: MainText('person')),
  ];

  changeIndex(int index) {
    currentIndex = index;
    emit(MainChangeIndexState());
  }

  String currentLanguage = 'en';

  changeLanguage(String lang) {
    currentLanguage = lang;
    LocalData.saveString('myLanguage', lang);
    emit(MainChangeLanguageState());
  }
}
