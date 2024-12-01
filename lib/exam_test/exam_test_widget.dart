import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'exam_test_model.dart';
export 'exam_test_model.dart';

class ExamTestWidget extends StatefulWidget {
  const ExamTestWidget({
    super.key,
    required this.quizId,
    required this.time,
  });

  final DocumentReference? quizId;
  final int? time;

  @override
  State<ExamTestWidget> createState() => _ExamTestWidgetState();
}

class _ExamTestWidgetState extends State<ExamTestWidget> {
  late ExamTestModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ExamTestModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.instantTimer = InstantTimer.periodic(
        duration: Duration(milliseconds: 1000),
        callback: (timer) async {
          _model.timerController.onStartTimer();
        },
        startImmediately: true,
      );
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<QuestionsRecord>>(
      stream: queryQuestionsRecord(
        queryBuilder: (questionsRecord) => questionsRecord.where(
          'quizId',
          isEqualTo: widget!.quizId,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Color(0xFFEEEEEE),
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<QuestionsRecord> examTestQuestionsRecordList = snapshot.data!;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: WillPopScope(
            onWillPop: () async => false,
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: Color(0xFFEEEEEE),
              appBar: AppBar(
                backgroundColor: Color(0xFFEEEEEE),
                automaticallyImplyLeading: false,
                title: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 20.0, 0.0, 0.0),
                              child: Text(
                                'Soal No.',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Source Serif 4',
                                      color: Colors.black,
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                          ],
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, -1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 15.0, 0.0, 0.0),
                            child: Container(
                              width: 30.0,
                              height: 30.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Text(
                                  valueOrDefault<String>(
                                    _model.onPage?.toString(),
                                    '1',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Source Serif 4',
                                        color: Colors.black,
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Flexible(
                      child: Align(
                        alignment: AlignmentDirectional(1.0, -1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 15.0, 15.0, 0.0),
                          child: Container(
                            width: 200.0,
                            height: 35.0,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(0.0),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: 100.0,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0.0),
                                      bottomRight: Radius.circular(0.0),
                                      topLeft: Radius.circular(0.0),
                                      topRight: Radius.circular(0.0),
                                    ),
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Text(
                                      'Sisa Waktu',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Source Serif 4',
                                            color: Colors.black,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 100.0,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF4B70F5),
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: StreamBuilder<List<QuizzesRecord>>(
                                      stream: queryQuizzesRecord(
                                        singleRecord: true,
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<QuizzesRecord>
                                            timerQuizzesRecordList =
                                            snapshot.data!;
                                        // Return an empty Container when the item does not exist.
                                        if (snapshot.data!.isEmpty) {
                                          return Container();
                                        }
                                        final timerQuizzesRecord =
                                            timerQuizzesRecordList.isNotEmpty
                                                ? timerQuizzesRecordList.first
                                                : null;

                                        return FlutterFlowTimer(
                                          initialTime: widget!.time!,
                                          getDisplayTime: (value) =>
                                              StopWatchTimer.getDisplayTime(
                                                  value,
                                                  milliSecond: false),
                                          controller: _model.timerController,
                                          updateStateInterval:
                                              Duration(milliseconds: 10),
                                          onChanged: (value, displayTime,
                                              shouldUpdate) {
                                            _model.timerMilliseconds = value;
                                            _model.timerValue = displayTime;
                                            if (shouldUpdate)
                                              safeSetState(() {});
                                          },
                                          onEnded: () async {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: Text('Time Out'),
                                                  content: Text(
                                                      'Waktu Anda Telah habis'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child: Text('Ok'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                            _model.instantTimer?.cancel();
                                            _model.readQuiz =
                                                await QuizzesRecord
                                                    .getDocumentOnce(
                                                        widget!.quizId!);

                                            await _model.readQuiz!.reference
                                                .update(createQuizzesRecordData(
                                              isAvailable: false,
                                            ));

                                            context
                                                .pushNamed('HomescreenDosen');

                                            safeSetState(() {});
                                          },
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .headlineSmall
                                              .override(
                                                fontFamily: 'Source Serif 4',
                                                color: Colors.white,
                                                fontSize: 18.0,
                                                letterSpacing: 0.0,
                                              ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                actions: [],
                centerTitle: false,
                elevation: 0.0,
              ),
              body: SafeArea(
                top: true,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 50.0, 20.0, 0.0),
                        child: Text(
                          _model.onIndex < examTestQuestionsRecordList.length
                              ? examTestQuestionsRecordList[_model.onIndex]
                                  .value
                              : '\"\"',
                          textAlign: TextAlign.start,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Source Serif 4',
                                    color: Colors.black,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 30.0, 20.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          height: 400.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4.0,
                                color: Color(0x33000000),
                                offset: Offset(
                                  0.0,
                                  2.0,
                                ),
                              )
                            ],
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      15.0, 25.0, 15.0, 25.0),
                                  child: TextFormField(
                                    controller: _model.textController,
                                    focusNode: _model.textFieldFocusNode,
                                    autofocus: true,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Jawaban Anda:',
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Source Serif 4',
                                            color: Colors.black,
                                            letterSpacing: 0.0,
                                          ),
                                      alignLabelWithHint: true,
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Source Serif 4',
                                            color: Colors.black,
                                            letterSpacing: 0.0,
                                          ),
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      focusedErrorBorder: InputBorder.none,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Source Serif 4',
                                          color: Colors.black,
                                          letterSpacing: 0.0,
                                        ),
                                    maxLines: 18,
                                    validator: _model.textControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 20.0, 20.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Flexible(
                                child: Align(
                                  alignment: AlignmentDirectional(1.0, 0.0),
                                  child: StreamBuilder<List<ResponsesRecord>>(
                                    stream: queryResponsesRecord(
                                      queryBuilder: (responsesRecord) =>
                                          responsesRecord.where(
                                        'quizId',
                                        isEqualTo: widget!.quizId,
                                      ),
                                      singleRecord: true,
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<ResponsesRecord>
                                          buttonResponsesRecordList =
                                          snapshot.data!;
                                      final buttonResponsesRecord =
                                          buttonResponsesRecordList.isNotEmpty
                                              ? buttonResponsesRecordList.first
                                              : null;

                                      return FFButtonWidget(
                                        onPressed: () async {
                                          if (_model.onPage ==
                                              examTestQuestionsRecordList
                                                  .length) {
                                            var confirmDialogResponse =
                                                await showDialog<bool>(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: Text(
                                                              'Konfirmasi Jawaban'),
                                                          content: Text(
                                                              'Apakah anda yakin ingin mengakhir ujian?'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext,
                                                                      false),
                                                              child:
                                                                  Text('Tidak'),
                                                            ),
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext,
                                                                      true),
                                                              child:
                                                                  Text('Iya'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    ) ??
                                                    false;
                                            if (confirmDialogResponse) {
                                              var answersRecordReference1 =
                                                  AnswersRecord.collection
                                                      .doc();
                                              await answersRecordReference1
                                                  .set(createAnswersRecordData(
                                                answerText:
                                                    _model.textController.text,
                                                questionId:
                                                    examTestQuestionsRecordList[
                                                            _model.onIndex]
                                                        .reference,
                                              ));
                                              _model.answersDocument2 =
                                                  AnswersRecord.getDocumentFromData(
                                                      createAnswersRecordData(
                                                        answerText: _model
                                                            .textController
                                                            .text,
                                                        questionId:
                                                            examTestQuestionsRecordList[
                                                                    _model
                                                                        .onIndex]
                                                                .reference,
                                                      ),
                                                      answersRecordReference1);
                                              _model.gptResponse2 =
                                                  await BrainBotAICall.call(
                                                messagesJson: functions
                                                    .convertToJSONInput(
                                                        _model.textController
                                                            .text,
                                                        examTestQuestionsRecordList[
                                                                _model.onIndex]
                                                            .value),
                                              );

                                              var scoresRecordReference1 =
                                                  ScoresRecord.collection.doc();
                                              await scoresRecordReference1
                                                  .set(createScoresRecordData(
                                                idScore:
                                                    examTestQuestionsRecordList[
                                                            _model.onIndex]
                                                        .reference,
                                                score: functions
                                                    .getNilai(getJsonField(
                                                  (_model.gptResponse2
                                                          ?.jsonBody ??
                                                      ''),
                                                  r'''$.choices[:].message.content''',
                                                ).toString()),
                                              ));
                                              _model.nilai2 = ScoresRecord
                                                  .getDocumentFromData(
                                                      createScoresRecordData(
                                                        idScore:
                                                            examTestQuestionsRecordList[
                                                                    _model
                                                                        .onIndex]
                                                                .reference,
                                                        score:
                                                            functions.getNilai(
                                                                getJsonField(
                                                          (_model.gptResponse2
                                                                  ?.jsonBody ??
                                                              ''),
                                                          r'''$.choices[:].message.content''',
                                                        ).toString()),
                                                      ),
                                                      scoresRecordReference1);
                                              _model.totalScores =
                                                  _model.totalScores! +
                                                      _model.nilai2!.score;
                                              safeSetState(() {});

                                              await PesanResRecord.collection
                                                  .doc()
                                                  .set(createPesanResRecordData(
                                                    pesanID:
                                                        examTestQuestionsRecordList[
                                                                _model.onIndex]
                                                            .reference,
                                                    pesan: functions
                                                        .getPesan(getJsonField(
                                                      (_model.gptResponse2
                                                              ?.jsonBody ??
                                                          ''),
                                                      r'''$.choices[:].message.content''',
                                                    ).toString()),
                                                  ));
                                              if (_model.onIndex == 0) {
                                                var responsesRecordReference1 =
                                                    ResponsesRecord.collection
                                                        .doc();
                                                await responsesRecordReference1
                                                    .set({
                                                  ...createResponsesRecordData(
                                                    uid: '',
                                                    quizId: widget!.quizId,
                                                    userId:
                                                        currentUserReference,
                                                  ),
                                                  ...mapToFirestore(
                                                    {
                                                      'answers': [
                                                        _model.answersDocument2
                                                            ?.reference
                                                      ],
                                                    },
                                                  ),
                                                });
                                                _model.response2 =
                                                    ResponsesRecord
                                                        .getDocumentFromData({
                                                  ...createResponsesRecordData(
                                                    uid: '',
                                                    quizId: widget!.quizId,
                                                    userId:
                                                        currentUserReference,
                                                  ),
                                                  ...mapToFirestore(
                                                    {
                                                      'answers': [
                                                        _model.answersDocument2
                                                            ?.reference
                                                      ],
                                                    },
                                                  ),
                                                }, responsesRecordReference1);
                                              } else {
                                                await buttonResponsesRecord!
                                                    .reference
                                                    .update({
                                                  ...createResponsesRecordData(
                                                    totalScores:
                                                        _model.totalScores,
                                                  ),
                                                  ...mapToFirestore(
                                                    {
                                                      'answers': FieldValue
                                                          .arrayUnion([
                                                        _model.answersDocument2
                                                            ?.reference
                                                      ]),
                                                    },
                                                  ),
                                                });
                                              }

                                              _model.quizzz =
                                                  await QuizzesRecord
                                                      .getDocumentOnce(
                                                          widget!.quizId!);

                                              await TotalScoresRecord.collection
                                                  .doc()
                                                  .set(
                                                      createTotalScoresRecordData(
                                                    totalScores:
                                                        _model.totalScores,
                                                    idTotalScores:
                                                        buttonResponsesRecord
                                                            ?.reference,
                                                  ));

                                              await _model.quizzz!.reference
                                                  .update({
                                                ...createQuizzesRecordData(
                                                  isAvailable: false,
                                                ),
                                                ...mapToFirestore(
                                                  {
                                                    'respons':
                                                        FieldValue.arrayUnion([
                                                      buttonResponsesRecord
                                                          ?.reference
                                                    ]),
                                                  },
                                                ),
                                              });
                                              _model.totalScores = 0;
                                              safeSetState(() {});
                                              _model.instantTimer?.cancel();

                                              context.pushNamed(
                                                  'HomescreenMahasiswa');
                                            }
                                          } else {
                                            var answersRecordReference2 =
                                                AnswersRecord.collection.doc();
                                            await answersRecordReference2
                                                .set(createAnswersRecordData(
                                              answerText:
                                                  _model.textController.text,
                                              questionId:
                                                  examTestQuestionsRecordList[
                                                          _model.onIndex]
                                                      .reference,
                                            ));
                                            _model.answersDocument =
                                                AnswersRecord
                                                    .getDocumentFromData(
                                                        createAnswersRecordData(
                                                          answerText: _model
                                                              .textController
                                                              .text,
                                                          questionId:
                                                              examTestQuestionsRecordList[
                                                                      _model
                                                                          .onIndex]
                                                                  .reference,
                                                        ),
                                                        answersRecordReference2);
                                            _model.gptResponse =
                                                await BrainBotAICall.call(
                                              messagesJson:
                                                  functions.convertToJSONInput(
                                                      _model
                                                          .textController.text,
                                                      examTestQuestionsRecordList[
                                                              _model.onIndex]
                                                          .value),
                                            );

                                            var scoresRecordReference2 =
                                                ScoresRecord.collection.doc();
                                            await scoresRecordReference2
                                                .set(createScoresRecordData(
                                              idScore:
                                                  examTestQuestionsRecordList[
                                                          _model.onIndex]
                                                      .reference,
                                              score: functions
                                                  .getNilai(getJsonField(
                                                (_model.gptResponse?.jsonBody ??
                                                    ''),
                                                r'''$.choices[:].message.content''',
                                              ).toString()),
                                            ));
                                            _model.nilai = ScoresRecord
                                                .getDocumentFromData(
                                                    createScoresRecordData(
                                                      idScore:
                                                          examTestQuestionsRecordList[
                                                                  _model
                                                                      .onIndex]
                                                              .reference,
                                                      score: functions.getNilai(
                                                          getJsonField(
                                                        (_model.gptResponse
                                                                ?.jsonBody ??
                                                            ''),
                                                        r'''$.choices[:].message.content''',
                                                      ).toString()),
                                                    ),
                                                    scoresRecordReference2);
                                            _model.totalScores =
                                                _model.totalScores! +
                                                    _model.nilai!.score;
                                            safeSetState(() {});

                                            await PesanResRecord.collection
                                                .doc()
                                                .set(createPesanResRecordData(
                                                  pesanID:
                                                      examTestQuestionsRecordList[
                                                              _model.onIndex]
                                                          .reference,
                                                  pesan: functions
                                                      .getPesan(getJsonField(
                                                    (_model.gptResponse
                                                            ?.jsonBody ??
                                                        ''),
                                                    r'''$.choices[:].message.content''',
                                                  ).toString()),
                                                ));
                                            if (_model.onIndex == 0) {
                                              var responsesRecordReference2 =
                                                  ResponsesRecord.collection
                                                      .doc();
                                              await responsesRecordReference2
                                                  .set({
                                                ...createResponsesRecordData(
                                                  uid: '',
                                                  quizId: widget!.quizId,
                                                  userId: currentUserReference,
                                                ),
                                                ...mapToFirestore(
                                                  {
                                                    'answers': [
                                                      _model.answersDocument
                                                          ?.reference
                                                    ],
                                                  },
                                                ),
                                              });
                                              _model.response = ResponsesRecord
                                                  .getDocumentFromData({
                                                ...createResponsesRecordData(
                                                  uid: '',
                                                  quizId: widget!.quizId,
                                                  userId: currentUserReference,
                                                ),
                                                ...mapToFirestore(
                                                  {
                                                    'answers': [
                                                      _model.answersDocument
                                                          ?.reference
                                                    ],
                                                  },
                                                ),
                                              }, responsesRecordReference2);
                                            } else {
                                              await buttonResponsesRecord!
                                                  .reference
                                                  .update({
                                                ...createResponsesRecordData(
                                                  totalScores:
                                                      _model.totalScores,
                                                ),
                                                ...mapToFirestore(
                                                  {
                                                    'answers':
                                                        FieldValue.arrayUnion([
                                                      _model.answersDocument
                                                          ?.reference
                                                    ]),
                                                  },
                                                ),
                                              });
                                            }

                                            _model.onIndex = _model.onIndex + 1;
                                            _model.onPage = _model.onPage! + 1;
                                            safeSetState(() {});
                                            safeSetState(() {
                                              _model.textController?.clear();
                                            });
                                          }

                                          safeSetState(() {});
                                        },
                                        text: 'Selanjutnya',
                                        options: FFButtonOptions(
                                          width: 150.0,
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  15.0, 0.0, 15.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: Color(0xFF4B70F5),
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily:
                                                        'Source Serif 4',
                                                    color: Colors.white,
                                                    fontSize: 14.0,
                                                    letterSpacing: 0.0,
                                                  ),
                                          elevation: 3.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
