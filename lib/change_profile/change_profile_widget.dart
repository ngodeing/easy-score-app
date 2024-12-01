import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'change_profile_model.dart';
export 'change_profile_model.dart';

class ChangeProfileWidget extends StatefulWidget {
  const ChangeProfileWidget({super.key});

  @override
  State<ChangeProfileWidget> createState() => _ChangeProfileWidgetState();
}

class _ChangeProfileWidgetState extends State<ChangeProfileWidget> {
  late ChangeProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChangeProfileModel());

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
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF1F4F8),
      body: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              'assets/images/Rectangle_49.png',
              width: 430.0,
              height: 332.0,
              fit: BoxFit.cover,
            ),
          ),
          Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, -0.73),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100.0),
                  child: Image.network(
                    valueOrDefault<String>(
                      _model.uploadedFileUrl,
                      'https://res.cloudinary.com/dhf1recqk/image/upload/v1730390616/pixdkbfvuvln94hdr4ez.png',
                    ),
                    width: 100.0,
                    height: 100.0,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.22, -0.77),
                child: FlutterFlowIconButton(
                  borderRadius: 36.0,
                  buttonSize: 36.0,
                  fillColor: Colors.white,
                  icon: FaIcon(
                    FontAwesomeIcons.pencilAlt,
                    color: Color(0xFFCECECE),
                    size: 16.0,
                  ),
                  onPressed: () async {
                    final selectedMedia =
                        await selectMediaWithSourceBottomSheet(
                      context: context,
                      maxWidth: 100.00,
                      maxHeight: 100.00,
                      imageQuality: 100,
                      allowPhoto: true,
                      backgroundColor: Colors.white,
                      textColor: Colors.black,
                    );
                    if (selectedMedia != null &&
                        selectedMedia.every((m) =>
                            validateFileFormat(m.storagePath, context))) {
                      safeSetState(() => _model.isDataUploading = true);
                      var selectedUploadedFiles = <FFUploadedFile>[];

                      var downloadUrls = <String>[];
                      try {
                        selectedUploadedFiles = selectedMedia
                            .map((m) => FFUploadedFile(
                                  name: m.storagePath.split('/').last,
                                  bytes: m.bytes,
                                  height: m.dimensions?.height,
                                  width: m.dimensions?.width,
                                  blurHash: m.blurHash,
                                ))
                            .toList();

                        downloadUrls = (await Future.wait(
                          selectedMedia.map(
                            (m) async =>
                                await uploadData(m.storagePath, m.bytes),
                          ),
                        ))
                            .where((u) => u != null)
                            .map((u) => u!)
                            .toList();
                      } finally {
                        _model.isDataUploading = false;
                      }
                      if (selectedUploadedFiles.length ==
                              selectedMedia.length &&
                          downloadUrls.length == selectedMedia.length) {
                        safeSetState(() {
                          _model.uploadedLocalFile =
                              selectedUploadedFiles.first;
                          _model.uploadedFileUrl = downloadUrls.first;
                        });
                      } else {
                        safeSetState(() {});
                        return;
                      }
                    }

                    await currentUserReference!.update(createUsersRecordData(
                      photoUrl: valueOrDefault<String>(
                        _model.uploadedFileUrl,
                        'https://res.cloudinary.com/dhf1recqk/image/upload/v1730390616/pixdkbfvuvln94hdr4ez.png',
                      ),
                    ));
                  },
                ),
              ),
            ],
          ),
          Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, -0.5),
                  child: Container(
                    width: 200.0,
                    child: TextFormField(
                      controller: _model.textController,
                      focusNode: _model.textFieldFocusNode,
                      autofocus: false,
                      obscureText: false,
                      decoration: InputDecoration(
                        isDense: true,
                        labelStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Source Serif 4',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                        hintText: 'Nama....',
                        hintStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Source Serif 4',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        focusedErrorBorder: InputBorder.none,
                        contentPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Source Serif 4',
                            color: Colors.white,
                            letterSpacing: 0.0,
                          ),
                      cursorColor: FlutterFlowTheme.of(context).primaryText,
                      validator:
                          _model.textControllerValidator.asValidator(context),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.5, -0.51),
                  child: FlutterFlowIconButton(
                    borderRadius: 8.0,
                    buttonSize: 40.0,
                    icon: FaIcon(
                      FontAwesomeIcons.pencilAlt,
                      color: FlutterFlowTheme.of(context).info,
                      size: 16.0,
                    ),
                    onPressed: () {
                      print('NameChangeIconButton pressed ...');
                    },
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0.0, -0.39),
            child: FFButtonWidget(
              onPressed: () async {
                await currentUserReference!.update(createUsersRecordData(
                  displayName: _model.textController.text,
                ));
                await showDialog(
                  context: context,
                  builder: (alertDialogContext) {
                    return AlertDialog(
                      title: Text('Berhasil Disimpan'),
                      content: Text('Semua perubahan telah disimpan'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(alertDialogContext),
                          child: Text('Ok'),
                        ),
                      ],
                    );
                  },
                );
              },
              text: 'Simpan Profil',
              options: FFButtonOptions(
                height: 40.0,
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: Color(0x004B39EF),
                textStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                      fontFamily: 'Source Serif 4',
                      color: FlutterFlowTheme.of(context).info,
                      fontSize: 12.0,
                      letterSpacing: 0.0,
                    ),
                elevation: 0.0,
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).info,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(100.0),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(-0.95, -0.86),
            child: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              borderWidth: 1.0,
              buttonSize: 60.0,
              icon: Icon(
                Icons.arrow_back_rounded,
                color: Colors.white,
                size: 30.0,
              ),
              onPressed: () async {
                context.pop();
              },
            ),
          ),
        ],
      ),
    );
  }
}
