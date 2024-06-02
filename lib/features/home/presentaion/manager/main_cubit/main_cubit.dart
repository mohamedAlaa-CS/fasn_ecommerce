import 'package:fasn_ecommerce/core/router/app_router.dart';
import 'package:fasn_ecommerce/core/utils/local_data.dart';
import 'package:fasn_ecommerce/core/widgets/main_text.dart';
import 'package:fasn_ecommerce/features/cart/presentaion/views/cart_view.dart';
import 'package:fasn_ecommerce/features/favourite_page/presentaion/views/favourite_page.dart';
import 'package:fasn_ecommerce/features/home/presentaion/views/home_view.dart';
import 'package:fasn_ecommerce/features/search_page/presentation/views/search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());
  static MainCubit get(context) => BlocProvider.of(context);
  static MainCubit get getFalse =>
      BlocProvider.of(AppNavigator.context, listen: false);
  int currentIndex = 0;
  List<Widget> screens = [
    const HomeView(),
    const SearchView(),
    const CartView(),
    const FavouritePage(),
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

  List<ProductFav> prductsFav = [];
  addFavProduct(ProductFav prductFav) {
    try {
      prductsFav.firstWhere((p) => p.id == prductFav.id).isFav =
          prductFav.isFav;
    } catch (e) {
      prductsFav.add(prductFav);
    }
    emit(MainAddToFavState());
  }

  bool? isProductFav(int? id) {
    if (id == null) return false;
    try {
      return prductsFav.firstWhere((p) => p.id == id).isFav;
    } catch (e) {
      return null;
    }
  }
}

class ProductFav {
  int id;
  bool isFav;
  ProductFav({required this.id, required this.isFav});
}
