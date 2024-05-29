import 'package:fasn_ecommerce/features/home/data/models/home_model/banner_model.dart';
import 'package:fasn_ecommerce/features/home/data/models/home_model/home_model.dart';
import 'package:fasn_ecommerce/features/home/data/models/home_model/product_model.dart';
import 'package:fasn_ecommerce/features/home/data/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitial());
  List<ProductModel> productList = [];
  List<BannerModel> bannerList = [];
  List<HomeModel> homeModelList = [];
  static HomeCubit get(context) => BlocProvider.of<HomeCubit>(context);
  final HomeRepo homeRepo;
  getHomeData() async {
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
}
