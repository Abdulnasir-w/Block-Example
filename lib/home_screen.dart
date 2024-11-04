import 'package:bloc_example/Components/custom_button.dart';
import 'package:bloc_example/Counter/Screen/counter_screen.dart';
import 'package:bloc_example/Image%20Picker/UI/image_picker.dart';
import 'package:bloc_example/Switch/Ui/switch_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Home",
          style: TextStyle(fontSize: 17),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            CustomButton(
              title: "Counter",
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const CounterScreen()));
              },
            ),
            const SizedBox(
              height: 15,
            ),
            CustomButton(
              title: "Switch ",
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const SwitchScreen()));
              },
            ),
            const SizedBox(
              height: 15,
            ),
            CustomButton(
              title: "Image Picker",
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const ImagePickerScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
