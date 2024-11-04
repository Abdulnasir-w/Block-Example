import 'package:bloc_example/Switch/Bloc/switch_blocs.dart';
import 'package:bloc_example/Switch/Bloc/switch_events.dart';
import 'package:bloc_example/Switch/Bloc/switch_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchScreen extends StatelessWidget {
  const SwitchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print("Scaffold");
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Switch",
          style: TextStyle(fontSize: 17),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Notification",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.deepPurple,
                  ),
                ),
                BlocBuilder<SwitchBlocs, SwitchStates>(
                  buildWhen: (previous, current) =>
                      previous.isSwitch != current.isSwitch,
                  builder: (context, state) {
                    print("switch");
                    return Switch(
                      activeColor: Colors.white,
                      activeTrackColor: Colors.deepPurple,
                      inactiveThumbColor: Colors.white,
                      inactiveTrackColor: Colors.deepPurple,
                      value: state.isSwitch,
                      onChanged: (value) {
                        context
                            .read<SwitchBlocs>()
                            .add(EnableOrDisableNotification());
                      },
                    );
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            BlocBuilder<SwitchBlocs, SwitchStates>(
              buildWhen: (previous, current) =>
                  previous.slider != current.slider,
              builder: (context, state) {
                print("Container");
                return Container(
                  width: 300,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.deepPurple.withOpacity(state.slider),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 15,
            ),
            BlocBuilder<SwitchBlocs, SwitchStates>(
              buildWhen: (previous, current) =>
                  previous.slider != current.slider,
              builder: (context, state) {
                print("Slider");
                return Slider(
                  value: state.slider,
                  onChanged: (value) {
                    context.read<SwitchBlocs>().add(SliderEvent(slider: value));
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
