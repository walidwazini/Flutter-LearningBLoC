part of 'counter_cubit.dart';

// @immutable
// abstract class CounterState {}

class CounterState {
  int counterValue;
  bool wasIncremented;

  CounterState({ required this.counterValue, required this.wasIncremented});
}
