import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/firebase_auth/auth_util.dart';

dynamic convertToJSONScan(
  String answer,
  String question,
  String expertAnswer,
) {
  return json.decode('''[
    {
      "role": "user",
      "content":
          "Anggap kamu seorang dosen penilai ujian esai yang objektif, akurat, faktual dan memiliki kriteria penilaian yang tinggi. Periksa kebenaran dan kelengkapan jawaban berdasarkan sudut pandang kamu dan jawaban ahli. Jika ada kalimat yang typo jangan dinilai buruk dan perbaiki. Berikan penilaian dengan skor 1-100, jika salah sepenuhnya berikan skor 0, kemudian berikan komentar yang menjelaskan kekurangan jawaban serta jawaban yang benar pada value Pesan_Penilaian. Berikut soal dan jawaban yang akan anda nilai: Soal: $question Jawaban: $answer. Berikut jawaban ahli yang dapat kamu jadikan sebagai salah satu acuan penilaian: $expertAnswer. Berikan respon anda hanya dalam format json dengan value Nilai dan Pesan_Penilaian"
    }
  ]''');
}

dynamic convertToJSONInput(
  String answer,
  String questions,
) {
  return json.decode('''[
    {
      "role": "user",
      "content":
          "Anggap kamu seorang dosen penilai ujian esai yang objektif, akurat, faktual, dan memiliki kriteria penilaian yang tinggi. Periksa kebenaran dan kelengkapan jawaban. Berikan penilaian dengan skor 0-100, jika salah sepenuhnya berikan skor 0, kemudian berikan komentar yang menjelaskan kekurangan jawaban serta jawaban yang benar pada value Pesan_Penilaian. Berikut soal dan jawaban yang akan anda nilai: Soal: $questions Jawaban: $answer. Berikan respon anda hanya dalam format json dengan value Nilai dan Pesan_Penilaian"
    }
  ]''');
}

dynamic getJson(String response) {
  final jsonData = json.decode(response);
  // create a function for get content from gpt api response
  return jsonData;
}

int getNilai(String state) {
  final jsonData = jsonDecode(state);
  int nilai = jsonData["Nilai"];
  return nilai;
}

String getStatus(String state) {
  final jsonData = jsonDecode(state);
  String nilai = jsonData["Status_Jawaban"];
  return nilai;
}

String getPesan(String state) {
  final jsonData = jsonDecode(state);
  String pesan = jsonData["Pesan_Penilaian"];
  return pesan;
}
