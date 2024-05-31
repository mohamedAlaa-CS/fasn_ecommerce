part of 'product_cubit.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}

final class ProductAddOrRemoveFavLoading extends ProductState {}

final class ChangeShowState extends ProductState {}

final class DetailsPageState extends ProductState {}

final class ProductAddOrRemoveFavfailed extends ProductState {
  final String errorMessage;

  ProductAddOrRemoveFavfailed({required this.errorMessage});
}

final class ProductAddOrRemoveFavSuccess extends ProductState {
  final String message;

  ProductAddOrRemoveFavSuccess({required this.message});
}
