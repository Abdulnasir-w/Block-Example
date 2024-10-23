import 'package:bloc_example/Counter/block/counter_bloc.dart';
import 'package:bloc_example/Counter/block/counter_event.dart';
import 'package:bloc_example/Counter/block/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    print("Scaffold");
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<CounterBloc, CounterState>(builder: (context, state) {
            return Text(
              state.counter.toString(),
              style: TextStyle(fontSize: 60),
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
                  print("butt");
                  context.read<CounterBloc>().add(IncremnetCounter());
                },
                child: const Text("Increment"),
              ),
              const SizedBox(
                width: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<CounterBloc>().add(DecrementCounter());
                },
                child: const Text("Increment"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
