// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/foundation.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

import 'package:image_picker/image_picker.dart';

// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
import 'dart:io';

class TextRecognitionCustom extends StatefulWidget {
  const TextRecognitionCustom(
      {Key? key, this.width, this.height, required this.quizId})
      : super(key: key);

  final double? width;
  final double? height;
  final DocumentReference? quizId;
  @override
  _TextRecognitionCustom createState() => _TextRecognitionCustom();
}

class _TextRecognitionCustom extends State<TextRecognitionCustom> {
  File? _imageFile;
  String? viewText;
  bool isPressedBefore = false;

  Future<void> _pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _imageFile = File(pickedImage.path);
      });
      _processImage();
    }
  }

  Future<void> _processImage() async {
    final inputImage = InputImage.fromFilePath(_imageFile!.path);
    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
    final RecognizedText recognizedText =
        await textRecognizer.processImage(inputImage);
    viewText = recognizedText.text;
    FFAppState().update(() {
      FFAppState().scanResult = recognizedText.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _imageFile == null
                  ? Padding(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 50),
                      child: Text(
                          style: TextStyle(color: Colors.black),
                          "Pilih gambar yang ingin dipindai"))
                  : Image.file(_imageFile!),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _pickImage,
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(
                      Color.fromARGB(255, 33, 48, 255)),
                ),
                child: Text(
                    style: TextStyle(color: Colors.white), "Pindai Gambar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
