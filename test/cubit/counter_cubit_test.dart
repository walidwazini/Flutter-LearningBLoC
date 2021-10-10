import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:learning_bloc/Cubit/counter_cubit.dart';

void main(){
  group('CounterCubit', (){
    CounterCubit? counterCubit;
    
    setUp((){
      counterCubit = CounterCubit();
    });
    
    tearDown((){
      counterCubit!.close();
    });

    test('initial state of CounterCubit is CounterState(counterValue:0)', () {
      expect(counterCubit!.state, CounterState(counterValue: 0));
    });
    
  });
}