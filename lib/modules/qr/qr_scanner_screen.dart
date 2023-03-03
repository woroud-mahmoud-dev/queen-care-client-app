import 'dart:developer';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:queen_care/core/app_localization.dart';
import 'package:queen_care/core/utils/constant.dart';
import 'package:queen_care/core/widget/error_widget.dart';
import 'package:queen_care/core/widget/loading_widget.dart';
import 'package:queen_care/modules/qr/cubit/qr_cubit.dart';
import 'package:queen_care/modules/qr/widget/qr_result_widget.dart';

class QRViewScreen extends StatefulWidget {
  const QRViewScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRViewScreenState();
}

class _QRViewScreenState extends State<QRViewScreen> {
  Barcode? result;

  QRViewController? controller;

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    var scanArea = MediaQuery.of(context).size.width * 0.8;
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: BlocProvider(
        create: (context) => QrCubit(),
        child: BlocConsumer<QrCubit, QrState>(
          listener: (context, state) {
            if (state is ScanDone) {
              QrCubit.get(context).sendQrResult(state.scanData.code!);
            }
          },
          builder: (context, state) {
            return Container(
              height: h,
              width: w,
              decoration: customBoxDecoration,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(
                    height: 100,
                  ),
                  Text('scan_gift'.tr(context),
                      style: const TextStyle(color: darkGrey, fontSize: 17)),
                  const SizedBox(
                    height: 50,
                  ),
                  if (state is QrSendResultError)
                    CustomErrorWidget(
                      onPressed: () {
                        QrCubit.get(context).sendQrResult('title');
                      },
                    ),
                  state is QrSendResultLoading
                      ? const Center(child: LoadingWidget())
                      : state is QrSendResultSuccess
                          ? SizedBox(
                              height: h * 0.4,
                              width: h * 0.4,
                              child: ResultWidget(
                                  body: state.qrResult.body,
                                  title: state.qrResult.title),
                            )
                          : SizedBox(
                              height: h * 0.4,
                              width: h * 0.4,
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: QRView(
                                  key: qrKey,
                                  onQRViewCreated: QrCubit.get(context)
                                          .isScanDone
                                      ? _doNothing
                                      : (
                                          QRViewController controller,
                                        ) {
                                          _onQRViewCreated(controller, context);
                                        },
                                  overlay: QrScannerOverlayShape(
                                      borderColor: kPrimaryColor,
                                      //  borderRadius: 10,
                                      borderLength: 60,
                                      borderWidth: 6,
                                      cutOutSize: scanArea),
                                  onPermissionSet: (ctrl, p) =>
                                      _onPermissionSet(context, ctrl, p),
                                ),
                              )),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller, BuildContext context) {
    setState(() {
      this.controller = controller;
    });
    controller.resumeCamera();
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
      QrCubit.get(context).setScanning(true, scanData);
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();

    super.dispose();
  }

  void _doNothing(QRViewController controller) {
    debugPrint('stopped');
  }
}
