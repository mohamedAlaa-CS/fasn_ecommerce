import 'package:fasn_ecommerce/core/helper/extensions/assetss_widgets.dart';
import 'package:fasn_ecommerce/features/favourite_page/data/repos/favourite_repo_imple.dart';
import 'package:fasn_ecommerce/features/favourite_page/presentaion/manager/favourites_cubit/favourites_cubit.dart';
import 'package:fasn_ecommerce/features/favourite_page/presentaion/views/widgets/fav_product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          FavouritesCubit(FavouriterepoImple())..getAllFavourites(),
      child: BlocConsumer<FavouritesCubit, FavouritesState>(
        listener: (context, state) {},
        builder: (context, state) {
          var favCubit = FavouritesCubit.get(context);
          return Column(
            children: [
              Expanded(
                child: (state is FavouritesLoading)
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.separated(
                        separatorBuilder: (context, index) => 10.hSize,
                        itemCount: favCubit.favouritesList.length,
                        itemBuilder: (context, index) {
                          return FavProductWidget(
                            product: favCubit.favouritesList[index],
                            deletOnTap: () async {
                              await favCubit.removeProduct(
                                  favCubit.favouritesList[index]);
                            },
                          );
                        }),
              ),
              7.hSize,
              // AddToCartButton(
              //   onTap: () {},
              // )
            ],
          );
        },
      ),
    );
  }
}
