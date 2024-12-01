import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'answer_ocr_widget.dart' show AnswerOcrWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AnswerOcrModel extends FlutterFlowModel<AnswerOcrWidget> {
  ///  Local state fields for this page.

  DocumentReference? quizID;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (OCR Model)] action in Button widget.
  ApiCallResponse? apiResultp0w;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  AnswerMhsOcrRecord? createAnswer;
  // Stores action output result for [Backend Call - API (BrainBotAI)] action in Button widget.
  ApiCallResponse? gptResponse2;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ScanScoresRecord? nilai2;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ResponsesOcrRecord? responOCR;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
