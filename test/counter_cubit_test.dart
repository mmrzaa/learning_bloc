import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learning_bloc/counter_cubit.dart';

void main() {
  group('CounterCubit', () {
    CounterCubit? counterCubit;
    setUp(() {
      counterCubit = CounterCubit();
    });
    tearDown(() {
      counterCubit?.close();
    });
    test('the initial state for the CounterCubit is CounterState(counterValue: 0)', () {
      expect(counterCubit?.state, const CounterState(counterValue: 0));
    });
    blocTest<CounterCubit, CounterState>(
      'the cubit should emit a CounterState(counterValue: 1,'
      ' wasIncremented: true) when cubit.increment function is called',
      build: () => CounterCubit(),
      act: (cubit) => cubit.increment(),
      expect: () => [const CounterState(counterValue: 1, wasIncremented: true)],
    );
    blocTest<CounterCubit, CounterState>(
      'the cubit should emit a CounterState(counterValue: -1,'
      ' wasIncremented: false) when cubit.decrement function is called',
      build: () => CounterCubit(),
      act: (cubit) => cubit.decrement(),
      expect: () => [const CounterState(counterValue: -1, wasIncremented: false)],
    );
  });
}
