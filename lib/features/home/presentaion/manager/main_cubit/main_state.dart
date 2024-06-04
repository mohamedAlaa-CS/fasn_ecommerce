part of 'main_cubit.dart';

@immutable
sealed class MainState {}

final class MainInitial extends MainState {}

final class MainChangeLanguageState extends MainState {}

final class MainChangeIndexState extends MainState {}

final class MainAddToFavState extends MainState {}
