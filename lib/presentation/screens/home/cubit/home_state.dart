part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class ChangeLocaleState extends HomeState {
  final Locale locale;
  ChangeLocaleState(this.locale);
}

