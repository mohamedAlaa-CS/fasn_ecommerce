part of 'favourites_cubit.dart';

@immutable
sealed class FavouritesState {}

final class FavouritesInitial extends FavouritesState {}

final class FavouritesLoading extends FavouritesState {}

final class FavouritesSuccess extends FavouritesState {}

final class FavouritesFailed extends FavouritesState {}

final class RemoveFavouritesProductLoading extends FavouritesState {}

final class RemoveFavouritesProductSucess extends FavouritesState {}

final class RemoveFavouritesProductFailed extends FavouritesState {}
