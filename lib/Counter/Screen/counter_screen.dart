import 'package:bloc_example/Counter/block/counter_bloc.dart';
import 'package:bloc_example/Counter/block/counter_event.dart';
import 'package:bloc_example/Counter/block/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print("Scaffold");
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Counter",
          style: TextStyle(fontSize: 17),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<CounterBloc, CounterState>(builder: (context, state) {
            return Text(
              state.counter.toString(),
              style: const TextStyle(fontSize: 60),
            );
          }),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  print("Increment");
                  context.read<CounterBloc>().add(IncremnetCounter());
                },
                child: const Text("Increment"),
              ),
              const SizedBox(
                width: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  print("Decrement");
                  context.read<CounterBloc>().add(DecrementCounter());
                },
                child: const Text("Decrement"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
