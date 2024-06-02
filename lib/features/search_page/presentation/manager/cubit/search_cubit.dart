import 'package:fasn_ecommerce/core/helper/functions/show_snack_bar.dart';
import 'package:fasn_ecommerce/features/home/data/models/home_model/product_model.dart';
import 'package:fasn_ecommerce/features/search_page/data/repos/search_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());
  final SearchRepo searchRepo;
  static SearchCubit get(context) => BlocProvider.of(context);
  List<ProductModel> searcheList = [];
  Future<void> getSearchedList({required String text}) async {
    searcheList = [];
    emit(SearchLoading());
    if (text.isEmpty) {
      searcheList.clear();
      emit(SearchStop());
    }
    var result = await searchRepo.getSearchData(text: text);

    result.fold((error) {
      emit(SearchFailed());
      showSnackbar(error.message, error: true);
    }, (success) {
      emit(SearchSuccess());
      if (text.isEmpty) {
        searcheList = [];
      } else {
        searcheList = success;
      }
    });
  }
}
