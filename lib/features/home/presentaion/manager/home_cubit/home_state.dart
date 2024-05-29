part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeSuccess extends HomeState {}

final class HomeFailed extends HomeState {
  final String error;

  HomeFailed(this.error);
}

final class PageControllerBanner extends HomeState {}

final class CategoriesLoading extends HomeState {}

final class CategoriesSuccess extends HomeState {}

final class CategoriesFailed extends HomeState {
  final String error;

  CategoriesFailed(this.error);
}
