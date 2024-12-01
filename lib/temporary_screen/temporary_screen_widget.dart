import '/auth/firebase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'temporary_screen_model.dart';
export 'temporary_screen_model.dart';

class TemporaryScreenWidget extends StatefulWidget {
  /// Halaman awal  ketika masuk aplikasi
  ///
  const TemporaryScreenWidget({super.key});

  @override
  State<TemporaryScreenWidget> createState() => _TemporaryScreenWidgetState();
}

class _TemporaryScreenWidgetState extends State<TemporaryScreenWidget> {
  late TemporaryScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TemporaryScreenModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (currentUserDocument?.role == Role.dosen) {
        context.pushNamed('HomescreenDosen');
      } else {
        context.pushNamed('HomescreenMahasiswa');
      }
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: SvgPicture.asset(
                'assets/images/Group_120.svg',
                width: 93.0,
                height: 132.0,
                fit: BoxFit.cover,
                alignment: Alignment(0.0, 0.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
