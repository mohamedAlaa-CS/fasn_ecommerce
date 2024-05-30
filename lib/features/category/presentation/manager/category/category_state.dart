part of 'category_cubit.dart';

@immutable
sealed class CategoryState {}

final class CategoryInitial extends CategoryState {}

final class ProductsOfCategoryLoading extends CategoryState {}

final class ProductsOfCategorySuccess extends CategoryState {}

final class ProductsOfCategoryFailed extends CategoryState {
  final String message;
  ProductsOfCategoryFailed({required this.message});
}
