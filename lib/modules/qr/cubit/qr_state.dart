part of 'qr_cubit.dart';

abstract class QrState {}

class QrInitial extends QrState {}

class DeviceNotConnectedToSendOrderState extends QrState {}

class QrSendResultLoading extends QrState {}

class SetQRViewControllerState extends QrState {}

class QrSendResultSuccess extends QrState {
  final QrResult qrResult;

  QrSendResultSuccess({required this.qrResult});
}

class QrSendResultError extends QrState {}

class ScanDone extends QrState {
  final Barcode scanData;

  ScanDone({required this.scanData});
}

class ScanLoading extends QrState {}
