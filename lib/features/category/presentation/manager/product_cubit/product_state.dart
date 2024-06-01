part of 'product_cubit.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}

final class ProductAddOrRemoveFavLoading extends ProductState {}

final class ChangeShowState extends ProductState {}

final class DetailsPageState extends ProductState {}

final class AddItemState extends ProductState {}

final class RemoveItemState extends ProductState {}

final class ProductAddOrRemoveFavfailed extends ProductState {
  final String errorMessage;

  ProductAddOrRemoveFavfailed({required this.errorMessage});
}

final class ProductAddOrRemoveFavSuccess extends ProductState {
  final String message;

  ProductAddOrRemoveFavSuccess({required this.message});
}

final class ProdectAddToCartLoading extends ProductState {}

final class ProdectAddToCartFailed extends ProductState {}

final class ProdectAddToCartSuccess extends ProductState {}

final class ProductAddQuantityLoading extends ProductState {}

final class ProductAddQuantitySuccess extends ProductState {}

final class ProductAddQuantityfailuer extends ProductState {}
