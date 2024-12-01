// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
import "dart:io";
import 'package:image_picker/image_picker.dart';

Future imageRecognition() async {
  // File? imageFile;
  final pickedImage = await ImagePicker().pickImage(source: ImageSource.camera);
  if (pickedImage != null) {
    // imageFile = File(pickedImage.path);
    // final inputImage = InputImage.fromFilePath(imageFile.path);
    FFAppState().update(() {
      FFAppState().imageInput = pickedImage.path;
    });
  }
}
