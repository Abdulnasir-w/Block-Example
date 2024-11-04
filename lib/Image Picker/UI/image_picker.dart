import 'dart:io';

import 'package:bloc_example/Image%20Picker/Bloc/picker_bloc.dart';
import 'package:bloc_example/Image%20Picker/Bloc/picker_event.dart';
import 'package:bloc_example/Image%20Picker/Bloc/picker_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagePickerScreen extends StatelessWidget {
  const ImagePickerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Image Picker",
          style: TextStyle(fontSize: 17),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BlocBuilder<PickerBloc, PickerState>(
                  builder: (context, state) {
                    if (state.file == null) {
                      return InkWell(
                        onTap: () {
                          context.read<PickerBloc>().add(ImageFromGallery());
                        },
                        child: const CircleAvatar(
                          child: Icon(
                            Icons.camera,
                            size: 38,
                          ),
                        ),
                      );
                    } else {
                      return Image.file(File(state.file!.path.toString()));
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                BlocBuilder<PickerBloc, PickerState>(
                  builder: (context, state) {
                    if (state.file == null) {
                      return InkWell(
                        onTap: () {
                          context.read<PickerBloc>().add(ImageFromCamera());
                        },
                        child: const CircleAvatar(
                          child: Icon(
                            Icons.file_present,
                            size: 38,
                          ),
                        ),
                      );
                    } else {
                      return Image.file(File(state.file!.path.toString()));
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
