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

// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class TextRecognizerView extends StatefulWidget {
  const TextRecognizerView({
    Key? key,
    this.width,
    this.height,
    required this.documentId,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String documentId;

  @override
  State<TextRecognizerView> createState() => _TextRecognizerViewState();
}

class _TextRecognizerViewState extends State<TextRecognizerView> {
  String? result;
  File? selectedFile;

  @override
  void initState() {
    super.initState();
    _fetchImagePathAndDownload();
  }

  Future<void> _fetchImagePathAndDownload() async {
    try {
      // Fetch the document from Firestore to get the image path
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('temp_scan_response')
          .doc(widget.documentId)
          .get();

      if (documentSnapshot.exists) {
        String imagePath = documentSnapshot['images'];

        // Get a reference to the image file in Firebase Storage
        // final ref = FirebaseStorage.instance.ref().child(imagePath);
        final documentDirectory = await getApplicationDocumentsDirectory();
        final file = File('${documentDirectory.path}/temp_image.jpg');

        // Download the image and write it to the file
        // await ref.writeToFile(file);

        setState(() {
          selectedFile = file;
        });
      } else {
        print('Document does not exist');
      }
    } catch (e) {
      print('Error fetching image path or downloading image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: buildUI(),
    );
  }

  Widget buildUI() {
    return FutureBuilder<String?>(
        future: _processImage(selectedFile!),
        builder: (context, snapshot) {
          return Text(snapshot.data ?? "",
              style: const TextStyle(
                fontSize: 25,
                color: Colors.black,
              ));
        });
  }

  Future<String?> _processImage(File file) async {
    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
    final InputImage inputImage = InputImage.fromFile(file);
    final RecognizedText recognizedText =
        await textRecognizer.processImage(inputImage);
    String resultText = recognizedText.text;
    textRecognizer.close();

    return resultText;
  }
}
