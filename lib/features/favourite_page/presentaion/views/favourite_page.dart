import 'package:fasn_ecommerce/core/helper/extensions/assetss_widgets.dart';
import 'package:fasn_ecommerce/features/favourite_page/data/repos/favourite_repo_imple.dart';
import 'package:fasn_ecommerce/features/favourite_page/presentaion/manager/favourites_cubit/favourites_cubit.dart';
import 'package:fasn_ecommerce/features/favourite_page/presentaion/views/widgets/add_to_cart_widget.dart';
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
                child: ListView.separated(
                    separatorBuilder: (context, index) => 10.hSize,
                    itemCount: favCubit.favouritesList.length,
                    itemBuilder: (context, index) {
                      return FavProductWidget(
                        image: favCubit.favouritesList[index].image ?? '',
                        // 'https://images.unsplash.com/photo-1575936123452-b67c3203c357?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D',
                        title: favCubit.favouritesList[index].name ?? '',
                        price: favCubit.favouritesList[index].price ?? 0,
                        oldPrice: favCubit.favouritesList[index].oldPrice ?? 0,
                        deletOnTap: () async {
                          await favCubit
                              .removeProduct(favCubit.favouritesList[index]);
                        },
                        addOnTap: () {},
                        removeOnTap: () {},
                        qty: 1,
                      );
                    }),
              ),
              7.hSize,
              AddToCartButton(
                onTap: () {},
              )
            ],
          );
        },
      ),
    );
  }
}
