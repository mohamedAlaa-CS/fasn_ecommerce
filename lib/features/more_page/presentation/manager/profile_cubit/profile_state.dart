part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ChangeIsUpdated extends ProfileState {}

final class GetProfileLoading extends ProfileState {}

final class GetProfileSuccess extends ProfileState {}

final class GetProfileFailed extends ProfileState {}

final class UpdateProfileLoading extends ProfileState {}

final class UpdateProfileSuccess extends ProfileState {}

final class UpdateProfileFailed extends ProfileState {}

final class SetImageSuccess extends ProfileState {}

final class LogOutFailed extends ProfileState {}

final class LogOutSuccess extends ProfileState {}

final class LogOutLoading extends ProfileState {}
