part of 'counter_cubit.dart';

// @immutable
// abstract class CounterState {}

class CounterState extends Equatable {
  int counterValue;
  bool? wasIncremented;

  CounterState({ required this.counterValue,  this.wasIncremented});

  @override
  // TODO: implement props
  List<Object> get props => [this.counterValue, this.wasIncremented!];
}
