part of 'counter_cubit.dart';

@immutable
sealed class CounterState {}

final class CounterInitial extends CounterState {}

final class IncreamentState extends CounterState {}

final class DecreamentState extends CounterState {}
