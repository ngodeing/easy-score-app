import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'answer_ocr_model.dart';
export 'answer_ocr_model.dart';

class AnswerOcrWidget extends StatefulWidget {
  const AnswerOcrWidget({
    super.key,
    required this.quizID,
  });

  final DocumentReference? quizID;

  @override
  State<AnswerOcrWidget> createState() => _AnswerOcrWidgetState();
}

class _AnswerOcrWidgetState extends State<AnswerOcrWidget> {
  late AnswerOcrModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AnswerOcrModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<QuizzesRecord>>(
      stream: queryQuizzesRecord(
        singleRecord: true,
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
        List<QuizzesRecord> answerOcrQuizzesRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final answerOcrQuizzesRecord = answerOcrQuizzesRecordList.isNotEmpty
            ? answerOcrQuizzesRecordList.first
            : null;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Color(0xFFEEEEEE),
            appBar: AppBar(
              backgroundColor: Color(0xFFEEEEEE),
              automaticallyImplyLeading: false,
              leading: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.safePop();
                },
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                  size: 22.0,
                ),
              ),
              title: Align(
                alignment: AlignmentDirectional(-1.0, 0.0),
                child: Text(
                  'Pindai Jawaban',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily: 'Source Serif 4',
                        color: Colors.black,
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w800,
                      ),
                ),
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
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            30.0, 30.0, 30.0, 50.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: 326.0,
                                      height: 80.0,
                                      decoration: BoxDecoration(),
                                      child: Wrap(
                                        spacing: 0.0,
                                        runSpacing: 0.0,
                                        alignment: WrapAlignment.start,
                                        crossAxisAlignment:
                                            WrapCrossAlignment.start,
                                        direction: Axis.horizontal,
                                        runAlignment: WrapAlignment.start,
                                        verticalDirection:
                                            VerticalDirection.down,
                                        clipBehavior: Clip.none,
                                        children: [
                                          Align(
                                            alignment: AlignmentDirectional(
                                                -1.0, -1.0),
                                            child: Text(
                                              'Silahkan masukkan jawaban Anda sebagai dasar penilaian',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Source Serif 4',
                                                        color: Colors.black,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 30.0, 0.0, 30.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      FFButtonWidget(
                                        onPressed: () async {
                                          var confirmDialogResponse =
                                              await showDialog<bool>(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return AlertDialog(
                                                        title: Text(
                                                            'Upload Gambar'),
                                                        content: Text(
                                                            'Pilih sumber gambar yang ingin dipindai'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    false),
                                                            child:
                                                                Text('Galeri'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    true),
                                                            child:
                                                                Text('Kamera'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  ) ??
                                                  false;
                                          if (confirmDialogResponse) {
                                            await actions.imageRecognition();
                                            _model.apiResultp0w =
                                                await OCRHandwrittenGroup
                                                    .oCRModelCall
                                                    .call(
                                              imageInput:
                                                  FFAppState().imageInput,
                                            );

                                            if ((_model
                                                    .apiResultp0w?.succeeded ??
                                                true)) {
                                              FFAppState().scanResult =
                                                  getJsonField(
                                                (_model.apiResultp0w
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$[:].generated_text''',
                                              ).toString();
                                              safeSetState(() {});
                                            } else {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    title: Text(
                                                        'Pengenalan Tulisan Gagal!'),
                                                    content: Text(
                                                        'Silahkan melakukan pengambilan gambar ulang'),
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
                                            }

                                            safeSetState(() {
                                              _model.textController?.text =
                                                  FFAppState().scanResult;
                                              _model.textFieldFocusNode
                                                  ?.requestFocus();
                                              WidgetsBinding.instance
                                                  .addPostFrameCallback((_) {
                                                _model.textController
                                                        ?.selection =
                                                    TextSelection.collapsed(
                                                  offset: _model.textController!
                                                      .text.length,
                                                );
                                              });
                                            });
                                          } else {
                                            await actions
                                                .imageRecognitionGallery();
                                            safeSetState(() {
                                              _model.textController?.text =
                                                  FFAppState().scanResult;
                                              _model.textFieldFocusNode
                                                  ?.requestFocus();
                                              WidgetsBinding.instance
                                                  .addPostFrameCallback((_) {
                                                _model.textController
                                                        ?.selection =
                                                    TextSelection.collapsed(
                                                  offset: _model.textController!
                                                      .text.length,
                                                );
                                              });
                                            });
                                          }

                                          safeSetState(() {});
                                        },
                                        text: 'Pindai gambar',
                                        options: FFButtonOptions(
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily:
                                                        'Source Serif 4',
                                                    color: Colors.white,
                                                    fontSize: 12.0,
                                                    letterSpacing: 0.0,
                                                  ),
                                          elevation: 3.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 30.0, 10.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'Lihat dan edit hasil pemindaian',
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
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          30.0, 10.0, 30.0, 20.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 8.0, 0.0),
                              child: TextFormField(
                                controller: _model.textController,
                                focusNode: _model.textFieldFocusNode,
                                autofocus: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Hasil pemindaian',
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Source Serif 4',
                                        letterSpacing: 0.0,
                                      ),
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        letterSpacing: 0.0,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x39262D34),
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Source Serif 4',
                                      color: Colors.black,
                                      letterSpacing: 0.0,
                                    ),
                                maxLines: 100,
                                minLines: 1,
                                validator: _model.textControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            30.0, 20.0, 30.0, 50.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(1.0, 1.0),
                              child: StreamBuilder<List<QuestionOcrRecord>>(
                                stream: queryQuestionOcrRecord(
                                  queryBuilder: (questionOcrRecord) =>
                                      questionOcrRecord.where(
                                    'quiz_id',
                                    isEqualTo: widget!.quizID,
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
                                  List<QuestionOcrRecord>
                                      buttonQuestionOcrRecordList =
                                      snapshot.data!;
                                  final buttonQuestionOcrRecord =
                                      buttonQuestionOcrRecordList.isNotEmpty
                                          ? buttonQuestionOcrRecordList.first
                                          : null;

                                  return FFButtonWidget(
                                    onPressed: () async {
                                      var answerMhsOcrRecordReference =
                                          AnswerMhsOcrRecord.collection.doc();
                                      await answerMhsOcrRecordReference
                                          .set(createAnswerMhsOcrRecordData(
                                        quizId: widget!.quizID,
                                        value: _model.textController.text,
                                      ));
                                      _model.createAnswer = AnswerMhsOcrRecord
                                          .getDocumentFromData(
                                              createAnswerMhsOcrRecordData(
                                                quizId: widget!.quizID,
                                                value:
                                                    _model.textController.text,
                                              ),
                                              answerMhsOcrRecordReference);
                                      var confirmDialogResponse =
                                          await showDialog<bool>(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    title: Text(
                                                        'Konfirmasi Jawaban'),
                                                    content: Text(
                                                        'Apakah anda yakin ingin menyimpan jawaban?'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext,
                                                                false),
                                                        child: Text('Tidak'),
                                                      ),
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext,
                                                                true),
                                                        child: Text('Iya'),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              ) ??
                                              false;
                                      if (confirmDialogResponse) {
                                        _model.gptResponse2 =
                                            await BrainBotAICall.call(
                                          messagesJson:
                                              functions.convertToJSONInput(
                                                  _model.textController.text,
                                                  buttonQuestionOcrRecord!
                                                      .value),
                                        );

                                        var scanScoresRecordReference =
                                            ScanScoresRecord.collection.doc();
                                        await scanScoresRecordReference
                                            .set(createScanScoresRecordData(
                                          quizID: widget!.quizID,
                                          score: getJsonField(
                                            (_model.gptResponse2?.jsonBody ??
                                                ''),
                                            r'''$.choices[:].message.content''',
                                          ),
                                        ));
                                        _model.nilai2 = ScanScoresRecord
                                            .getDocumentFromData(
                                                createScanScoresRecordData(
                                                  quizID: widget!.quizID,
                                                  score: getJsonField(
                                                    (_model.gptResponse2
                                                            ?.jsonBody ??
                                                        ''),
                                                    r'''$.choices[:].message.content''',
                                                  ),
                                                ),
                                                scanScoresRecordReference);

                                        await PesanResOcrRecord.collection
                                            .doc()
                                            .set(createPesanResOcrRecordData(
                                              pesanID: answerOcrQuizzesRecord
                                                  ?.reference,
                                              pesan: functions
                                                  .getPesan(getJsonField(
                                                (_model.gptResponse2
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$.choices[:].message.content''',
                                              ).toString()),
                                            ));

                                        var responsesOcrRecordReference =
                                            ResponsesOcrRecord.collection.doc();
                                        await responsesOcrRecordReference
                                            .set(createResponsesOcrRecordData(
                                          score: _model.nilai2?.score,
                                          quizId: widget!.quizID,
                                          userId: currentUserReference,
                                          answerMhs:
                                              _model.createAnswer?.reference,
                                        ));
                                        _model.responOCR = ResponsesOcrRecord
                                            .getDocumentFromData(
                                                createResponsesOcrRecordData(
                                                  score: _model.nilai2?.score,
                                                  quizId: widget!.quizID,
                                                  userId: currentUserReference,
                                                  answerMhs: _model
                                                      .createAnswer?.reference,
                                                ),
                                                responsesOcrRecordReference);

                                        await widget!.quizID!.update({
                                          ...mapToFirestore(
                                            {
                                              'responsOcr':
                                                  FieldValue.arrayUnion([
                                                _model.responOCR?.reference
                                              ]),
                                            },
                                          ),
                                        });

                                        context.goNamed('HomescreenMahasiswa');
                                      }

                                      safeSetState(() {});
                                    },
                                    text: 'Simpan',
                                    options: FFButtonOptions(
                                      height: 40.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: Color(0xFF4B70F5),
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Source Serif 4',
                                            color: Colors.white,
                                            fontSize: 12.0,
                                            letterSpacing: 0.0,
                                          ),
                                      elevation: 3.0,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  );
                                },
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
        );
      },
    );
  }
}
