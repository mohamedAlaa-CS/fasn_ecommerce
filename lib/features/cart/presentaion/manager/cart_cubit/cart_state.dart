part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

final class CartLoading extends CartState {}

final class CartSuccess extends CartState {}

final class CartFailed extends CartState {
  final String message;

  CartFailed({required this.message});
}

final class AddOrderLoading extends CartState {}

final class AddOrderSuccess extends CartState {}

final class AddOrderFailed extends CartState {}
