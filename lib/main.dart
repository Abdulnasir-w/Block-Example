import 'package:bloc_example/Counter/block/counter_bloc.dart';
import 'package:bloc_example/Image%20Picker/Bloc/picker_bloc.dart';
import 'package:bloc_example/Image%20Picker/Utils/picker_code.dart';
import 'package:bloc_example/Switch/Bloc/switch_blocs.dart';
import 'package:bloc_example/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CounterBloc()),
        BlocProvider(create: (_) => SwitchBlocs()),
        BlocProvider(create: (_) => PickerBloc(Picker())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
