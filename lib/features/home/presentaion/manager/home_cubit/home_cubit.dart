import 'package:fasn_ecommerce/features/category/data/models/category_model.dart';
import 'package:fasn_ecommerce/features/home/data/models/home_model/banner_model.dart';
import 'package:fasn_ecommerce/features/home/data/models/home_model/product_model.dart';
import 'package:fasn_ecommerce/features/home/data/repos/home_repo.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitial()) {
    pageControllerBanner();
    returnAllHomeData();
  }
  static HomeCubit get(context) => BlocProvider.of<HomeCubit>(context);

  PageController pageController = PageController();
  int currentIndex = 0;
  pageControllerBanner() {
    pageController.addListener(() {
      currentIndex = pageController.page!.round();
      emit(PageControllerBanner());
    });
  }

  returnAllHomeData() async {
    await Future.wait([
      getHomeData(),//-> 2
      getCategoriesData(),//->3
    ]);
  }

  List<ProductModel> productList = [];
  List<BannerModel> bannerList = [];

  final HomeRepo homeRepo;
  Future<void> getHomeData() async {
    emit(HomeLoading());
    var result = await homeRepo.getHomeData();
    result.fold((erroe) {
      emit(HomeFailed(erroe.message));
    }, (data) {
      emit(HomeSuccess());
      productList.addAll(data.products ?? []);
      bannerList.addAll(data.banners ?? []);
    });
  }

  List<CategoryModel> categoriesList = [];
  Future<void> getCategoriesData() async {
    emit(HomeLoading());
    var result = await homeRepo.getCategoresData();
    result.fold((erroe) {
      emit(HomeFailed(erroe.message));
    }, (data) {
      emit(HomeSuccess());
      categoriesList.addAll(data);
    });
  }
}
