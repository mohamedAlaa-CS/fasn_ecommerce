part of 'more_cubit.dart';

@immutable
sealed class MoreState {}

final class MoreInitial extends MoreState {}

final class MoreChangeSettingIsShow extends MoreState {}

final class MoreGetCommonQuestionLoading extends MoreState {}

final class MoreGetCommonQuestionSuccess extends MoreState {}

final class MoreGetCommonQuestionFailed extends MoreState {}

final class MoreGetAboutUsLoading extends MoreState {}

final class MoreGetAboutUsSuccess extends MoreState {}

final class MoreGetAboutUsFailed extends MoreState {}

final class MoreGetComplaintAndSuggestionLoading extends MoreState {}

final class MoreGetComplaintAndSuggestionSuccess extends MoreState {}

final class MoreGetComplaintAndSuggestionFailed extends MoreState {}
