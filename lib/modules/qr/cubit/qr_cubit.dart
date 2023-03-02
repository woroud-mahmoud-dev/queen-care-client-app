import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:queen_care/models/qr_result.dart';
import 'package:queen_care/network/local/cache_helper.dart';
import 'package:http/http.dart' as http;

part 'qr_state.dart';

class QrCubit extends Cubit<QrState> {
  QrCubit() : super(QrInitial());
  static QrCubit get(context) => BlocProvider.of(context);
  QRViewController? controller;
  String? title;
  QrResult? result;
  bool isScanDone = false;
  QRViewController? qrViewController;

  bool scanDone = false;
  final InternetConnectionChecker connectionChecker =
      InternetConnectionChecker();


  void setScanning(bool value, Barcode scanData) {
    isScanDone = value;
    emit(ScanDone(scanData: scanData));
  }

  Future<QrResult?> sendQrResult(String title) async {
    print(title);
    emit(QrSendResultLoading());
    if (await connectionChecker.hasConnection) {
      print('title');
      print(title);
      try {
        var myUrl = Uri.parse(
            "https://karam-app.com/celo/queencare/public/api/qrgenerate");

        final response = await http.post(myUrl, body: {
          'token': CacheHelper.getData(key: 'api_token'),
          'title': title
        });
        debugPrint(response.statusCode.toString());
        if (response.statusCode == 200) {
          result = qrResultFromJson(response.body);
          emit(QrSendResultSuccess(qrResult: result!));
        } else if (response.statusCode == 404) {
          emit(QrSendResultError());
        }
      } catch (e) {
        emit(QrSendResultError());
      }
    } else {
      emit(DeviceNotConnectedToSendOrderState());
      return null;
    }
    return null;
  }
}
