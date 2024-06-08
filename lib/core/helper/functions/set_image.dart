import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

Future<File?> pickImage(BuildContext context) async {
  File? file;
  final picker = ImagePicker();

  final source = await showDialog<ImageSource>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Select Image Source'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context, ImageSource.camera);
              },
              icon: const Icon(Icons.camera),
              label: const Text('Camera'),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context, ImageSource.gallery);
              },
              icon: const Icon(Icons.image),
              label: const Text('Gallery'),
            ),
          ],
        ),
      );
    },
  );

  if (source != null) {
    final pickedFile = await picker.pickImage(source: source);

    file = File(pickedFile!.path);
  }
  return file;
}
