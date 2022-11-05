import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubits/counter/counter_cubit.dart';

class ShowMeCounterPage extends StatelessWidget {
  static const id = '/show-me';

  const ShowMeCounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
      body: Center(
        child: BlocSelector<CounterCubit, CounterState, int>(
          selector: (state) => state.counter,
          builder: (ctx, counter) => Text(
            '$counter',
            style: const TextStyle(fontSize: 52),
          ),
        ),
      ),
    );
  }
}
