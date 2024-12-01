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

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dio/dio.dart';

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
import "dart:io";
import 'package:image_picker/image_picker.dart';

Future imageRecognitionGallery() async {
  final pickedImage =
      await ImagePicker().pickImage(source: ImageSource.gallery);

  File imageFile = File(pickedImage!.path);
  final formData = FormData.fromMap({
    'file': await MultipartFile.fromFile(imageFile.path),
  });

  try {
    final response = await Dio().post(
      'https://api-inference.huggingface.co/models/microsoft/trocr-large-handwritten?apiKey=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', // URL server Python
      data: formData,
    );

    if (response.statusCode == 200) {
      FFAppState().update(() {
        FFAppState().imageInput = response.data;
      });
    }
  } catch (e) {
    FFAppState().update(() {
      FFAppState().imageInput = "error 505";
    });
  }
}
