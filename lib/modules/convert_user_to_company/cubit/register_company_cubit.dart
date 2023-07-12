import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:queen_care/core/utils/strings.dart';
import 'package:queen_care/network/local/cache_helper.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'dart:convert';

import 'dart:io' as io;
part 'register_company_state.dart';

class RegisterCompanyCubit extends Cubit<RegisterCompanyState> {
  RegisterCompanyCubit() : super(CompleteCompanyInfoInitial());
  static RegisterCompanyCubit get(context) => BlocProvider.of(context);
  bool isCompany = true;
  String? typeGroupValue;
  final InternetConnectionChecker connectionChecker =
      InternetConnectionChecker();
  String? type;
  String? imageName;
  String? img64;
  bool addImage = false;
  final ImagePicker picker = ImagePicker();

  XFile? selectedImage;
  Position? position;

  initLocation() async {
    bool isServiceEnabled;
    LocationPermission permission;

    isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    permission = await Geolocator.checkPermission();

    if (!isServiceEnabled) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('denied forever');
    } else if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('denied');
      }
    }
  }

  Future<Position> getLocation() async {
    bool isServiceEnabled;
    isServiceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!isServiceEnabled) {
      initLocation();
    }
    emit(LocationLoading());
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((position) {
      this.position = position;
      print(position.latitude.toString());
      print(position.longitude.toString());
      emit(LocationSuccess());
    }).catchError((error) {
      emit(LocationFail(error));
    });
    return position!;
  }

  void selectLogo({required ImageSource source}) async {
    selectedImage = await picker.pickImage(
      source: source,
    );
    if (selectedImage!.path.isNotEmpty) {
      final bytes = io.File(selectedImage!.path).readAsBytesSync();
      img64 = base64Encode(bytes);
      imageName = selectedImage!.name;
      addImage = true;
      if (kDebugMode) {
        print('imageName : $imageName');
      }
      if (kDebugMode) {
        print('base64 : $img64');
      }
      if (kDebugMode) {
        print('bytes : $bytes');
      }
      emit(AddImageSuccess());
    } else {
      emit(AddImageError());
    }
  }

  void changeCompanyType(String value) {
    type = value;
    emit(CompleteCompanyInfoChangeType());
  }

  void hasRegisterSelect(String value) {
    typeGroupValue = value;
    emit(CompleteCompanyInfoChangeType());
  }

  Future<void> registerCompany({
    required String idNumber,
    required String name,
    required String address,
  }) async {
    debugPrint(type);
    debugPrint(idNumber);
    debugPrint(address);

    emit(CompleteCompanyInfoLoading());
    if (await connectionChecker.hasConnection) {
      if (position != null) {
        try {
          var myUrl = Uri.parse("$baseUrl/registercompany");
          final Map<String, dynamic> body = addImage
              ? {
                  'token': CacheHelper.getData(key: 'api_token'),
                  'type': type,
                  'address': address,
                  'Id_number': idNumber,
                  'name': name,
                  'image': img64,
                  'imagename': imageName
                }
              : {
                  'token': CacheHelper.getData(key: 'api_token'),
                  'type': type,
                  'address': address,
                  'Id_number': idNumber,
                  'name': name,
                };

          final response = await http.post(myUrl, body: body);

          if (response.statusCode == 201) {
            CacheHelper.saveData(key: 'isCompany', value: true);
            debugPrint(response.body);
            emit(CompleteCompanyInfoSuccess());
          } else if (response.statusCode == 404) {
            emit(CompleteCompanyInfoError());
          }
        } catch (e) {
          if (kDebugMode) {
            print(e);
          }
          emit(CompleteCompanyInfoError());
        }
      } else {
        getLocation();
      }
    } else {
      emit(DeviceNotConnectedState());
    }
  }
}
