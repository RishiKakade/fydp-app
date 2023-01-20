import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  ApiCallResponse? apiResult2cr;
  ApiCallResponse? apiResultgsc;
  ApiCallResponse? apiResult9ko;
  AudioPlayer? soundPlayer1;
  AudioPlayer? soundPlayer2;
  AudioPlayer? soundPlayer3;
  AudioPlayer? soundPlayer4;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 10),
              child: GradientText(
                'VoiceKrispie',
                style: FlutterFlowTheme.of(context).title1.override(
                      fontFamily: 'Poppins',
                      fontSize: 50,
                      fontWeight: FontWeight.w100,
                    ),
                colors: [
                  FlutterFlowTheme.of(context).primaryColor,
                  FlutterFlowTheme.of(context).secondaryColor,
                  Color(0xFF673AB7),
                  Colors.blue,
                  Colors.red
                ],
                gradientDirection: GradientDirection.ltr,
                gradientType: GradientType.linear,
              ),
            ),
            Expanded(
              child: Image.network(
                FFAppState().scenePath,
                width: double.infinity,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 15),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  FFButtonWidget(
                    onPressed: () async {
                      var _shouldSetState = false;
                      if (FFAppState().recordState) {
                        setState(() {
                          FFAppState().recordState = false;
                          FFAppState().recordButtonColor = Color(0xFF139E93);
                          FFAppState().recordButtonText = 'Record';
                          FFAppState().scenePath =
                              'http://192.168.2.12:8080/scene';
                        });
                        apiResult2cr = await StopRecordingCall.call();
                        _shouldSetState = true;
                        if ((apiResult2cr?.succeeded ?? true)) {
                          apiResultgsc = await GetSceneCall.call();
                          _shouldSetState = true;
                          if ((apiResultgsc?.succeeded ?? true)) {
                            FFAppState().update(() {
                              FFAppState().scenePath = functions
                                  .genUniqueImagePath(FFAppState().scenePath);
                            });
                          } else {
                            if (_shouldSetState) setState(() {});
                            return;
                          }

                          if (_shouldSetState) setState(() {});
                          return;
                        } else {
                          if (_shouldSetState) setState(() {});
                          return;
                        }
                      } else {
                        FFAppState().update(() {
                          FFAppState().recordState = true;
                          FFAppState().recordButtonColor =
                              FlutterFlowTheme.of(context).alternate;
                          FFAppState().recordButtonText = 'Stop recording';
                        });
                        apiResult9ko = await StartRecordingCall.call();
                        _shouldSetState = true;
                        if ((apiResult9ko?.succeeded ?? true)) {
                          if (_shouldSetState) setState(() {});
                          return;
                        }

                        if (_shouldSetState) setState(() {});
                        return;
                      }

                      if (_shouldSetState) setState(() {});
                    },
                    text: valueOrDefault<String>(
                      FFAppState().recordButtonText,
                      'Record',
                    ),
                    icon: Icon(
                      Icons.fiber_smart_record,
                      size: 15,
                    ),
                    options: FFButtonOptions(
                      width: 340,
                      height: 80,
                      color: FFAppState().recordButtonColor,
                      textStyle:
                          FlutterFlowTheme.of(context).subtitle2.override(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w200,
                              ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      FFButtonWidget(
                        onPressed: () async {
                          soundPlayer1 ??= AudioPlayer();
                          if (soundPlayer1!.playing) {
                            await soundPlayer1!.stop();
                          }

                          await soundPlayer1!
                              .setUrl(functions
                                  .genUniqueAudioPath(FFAppState().redSpeaker))
                              .then((_) => soundPlayer1!.play());
                        },
                        text: '',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 100,
                          color: FlutterFlowTheme.of(context).alternate,
                          textStyle:
                              FlutterFlowTheme.of(context).subtitle2.override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(50),
                            topLeft: Radius.circular(0),
                            topRight: Radius.circular(0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      FFButtonWidget(
                        onPressed: () async {
                          soundPlayer2 ??= AudioPlayer();
                          if (soundPlayer2!.playing) {
                            await soundPlayer2!.stop();
                          }

                          await soundPlayer2!
                              .setUrl(functions.genUniqueAudioPath(
                                  FFAppState().greenSpeaker))
                              .then((_) => soundPlayer2!.play());
                        },
                        text: '',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 100,
                          color: Color(0xFF39D27D),
                          textStyle:
                              FlutterFlowTheme.of(context).subtitle2.override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(50),
                            bottomRight: Radius.circular(0),
                            topLeft: Radius.circular(0),
                            topRight: Radius.circular(0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      FFButtonWidget(
                        onPressed: () async {
                          soundPlayer3 ??= AudioPlayer();
                          if (soundPlayer3!.playing) {
                            await soundPlayer3!.stop();
                          }

                          await soundPlayer3!
                              .setUrl(functions.genUniqueAudioPath(
                                  FFAppState().orangeSpeaker))
                              .then((_) => soundPlayer3!.play());
                        },
                        text: '',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 100,
                          color: FlutterFlowTheme.of(context).tertiaryColor,
                          textStyle:
                              FlutterFlowTheme.of(context).subtitle2.override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(0),
                            topLeft: Radius.circular(0),
                            topRight: Radius.circular(50),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      FFButtonWidget(
                        onPressed: () async {
                          soundPlayer4 ??= AudioPlayer();
                          if (soundPlayer4!.playing) {
                            await soundPlayer4!.stop();
                          }

                          await soundPlayer4!
                              .setUrl(functions
                                  .genUniqueAudioPath(FFAppState().blueSpeaker))
                              .then((_) => soundPlayer4!.play());
                        },
                        text: '',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 100,
                          color: Color(0xFF397FEF),
                          textStyle:
                              FlutterFlowTheme.of(context).subtitle2.override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(0),
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(0),
                          ),
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
    );
  }
}
