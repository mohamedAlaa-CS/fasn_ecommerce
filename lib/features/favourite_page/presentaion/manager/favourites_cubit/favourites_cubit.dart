import 'package:fasn_ecommerce/core/helper/functions/show_snack_bar.dart';
import 'package:fasn_ecommerce/features/favourite_page/data/repos/favourite_repo.dart';
import 'package:fasn_ecommerce/features/home/data/models/home_model/product_model.dart';
import 'package:fasn_ecommerce/features/home/presentaion/manager/main_cubit/main_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'favourites_state.dart';

class FavouritesCubit extends Cubit<FavouritesState> {
  FavouritesCubit(this.favouriteRepo) : super(FavouritesInitial());
  static FavouritesCubit get(context) => BlocProvider.of(context);
  final FavouriteRepo favouriteRepo;
  List<ProductModel> favouritesList = [];
  getAllFavourites() async {
    // favouritesList.clear();
    emit(FavouritesLoading());

    var result = await favouriteRepo.getAllFavouriteData();

    result.fold((error) {
      emit(FavouritesFailed());
    }, (success) {
      emit(FavouritesSuccess());
      favouritesList = success;
    });
  }

  Future<void> removeFavouriteProduct({required int id}) async {
    emit(RemoveFavouritesProductLoading());
    var result = await favouriteRepo.removeFavouriteProduct(productId: id);

    result.fold((error) {
      emit(RemoveFavouritesProductFailed());
    }, (success) {
      showSnackbar(success);
      emit(RemoveFavouritesProductSucess());
      MainCubit.getFalse.addFavProduct(ProductFav(id: id, isFav: false));

      // getAllFavourites();
    });
  }

  Future removeProduct(ProductModel productModel) async {
    favouritesList.remove(productModel);
    emit(RemoveFavouritesProductSucess());
    await removeFavouriteProduct(id: productModel.id ?? 0);
  }
}
