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
import 'package:cloud_firestore/cloud_firestore.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({
    Key? key,
    this.width,
    this.height,
    required this.quizID,
  }) : super(key: key);
  final double? width;
  final double? height;
  final String quizID;
  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int totalNilai = 0;

  @override
  void initState() {
    super.initState();
    getTotalNilai(
        widget.quizID); // Ganti "quiz_id" dengan ID quiz yang sebenarnya
  }

  Future<void> getTotalNilai(String quizId) async {
    try {
      // Ambil semua jawaban dari quiz tertentu
      QuerySnapshot answerSnapshot = await FirebaseFirestore.instance
          .collection('answers')
          .where('quiz_id', isEqualTo: quizId)
          .get();

      int total = 0;

      // Loop melalui setiap jawaban
      for (var answerDoc in answerSnapshot.docs) {
        // Ambil nilai dari setiap jawaban berdasarkan question_id
        QuerySnapshot nilaiSnapshot = await FirebaseFirestore.instance
            .collection('scores')
            .where('question_id', isEqualTo: answerDoc['question_id'])
            .get();

        if (nilaiSnapshot.docs.isNotEmpty) {
          // Casting nilai menjadi int
          total += (nilaiSnapshot.docs.first['scores'] as num).toInt();
        }
      }

      setState(() {
        totalNilai = total;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('$totalNilai'),
      ),
    );
  }
}
