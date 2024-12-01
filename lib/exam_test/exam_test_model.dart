import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'exam_test_widget.dart' show ExamTestWidget;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ExamTestModel extends FlutterFlowModel<ExamTestWidget> {
  ///  Local state fields for this page.

  int onIndex = 0;

  int? onPage = 1;

  int? countdown = 5;

  int? totalScores = 0;

  ///  State fields for stateful widgets in this page.

  InstantTimer? instantTimer;
  // State field(s) for Timer widget.
  final timerInitialTimeMs = 0;
  int timerMilliseconds = 0;
  String timerValue = StopWatchTimer.getDisplayTime(0, milliSecond: false);
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  // Stores action output result for [Backend Call - Read Document] action in Timer widget.
  QuizzesRecord? readQuiz;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  AnswersRecord? answersDocument2;
  // Stores action output result for [Backend Call - API (BrainBotAI)] action in Button widget.
  ApiCallResponse? gptResponse2;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ScoresRecord? nilai2;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ResponsesRecord? response2;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  QuizzesRecord? quizzz;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  AnswersRecord? answersDocument;
  // Stores action output result for [Backend Call - API (BrainBotAI)] action in Button widget.
  ApiCallResponse? gptResponse;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ScoresRecord? nilai;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ResponsesRecord? response;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    instantTimer?.cancel();
    timerController.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
