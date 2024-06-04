part of 'cart_item_product_cubit.dart';

@immutable
sealed class CartItemProductState {}

final class CartItemProductInitial extends CartItemProductState {}

final class CartDeleteItemProductLoading extends CartItemProductState {}

final class CartDeleteItemProductSuccess extends CartItemProductState {}

final class CartDeleteItemProductFailed extends CartItemProductState {}

final class CartAddItemProduct extends CartItemProductState {}

final class CartRemoveItemProduct extends CartItemProductState {}

final class CartUpdateQunatatyLoading extends CartItemProductState {}

final class CartUpdateQunatatySuccess extends CartItemProductState {}

final class CartUpdateQunatatyFailed extends CartItemProductState {}
