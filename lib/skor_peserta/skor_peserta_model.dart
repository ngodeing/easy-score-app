import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'skor_peserta_widget.dart' show SkorPesertaWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SkorPesertaModel extends FlutterFlowModel<SkorPesertaWidget> {
  ///  Local state fields for this page.

  bool isAdded = true;

  int? totalQuiz = 0;

  int? menit5 = 300000;

  int? menit15 = 900000;

  int? menit30 = 1800000;

  int? jam1 = 3600000;

  int? jam2 = 7200000;

  int? dropDuration = 60000;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
