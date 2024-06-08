part of 'order_cubit.dart';

@immutable
sealed class OrderState {}

final class OrderInitial extends OrderState {}

final class GetOrdersLoading extends OrderState {}

final class GetOrdersSuccess extends OrderState {}

final class GetOrdersFailed extends OrderState {}
