import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:queen_care/network/local/cache_helper.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
part 'register_company_state.dart';

class RegisterCompanyCubit extends Cubit<RegisterCompanyState> {
  RegisterCompanyCubit() : super(CompleteCompanyInfoInitial());
  static RegisterCompanyCubit get(context) => BlocProvider.of(context);
  bool isCompany = true;
  String? typeGroupValue;
  final InternetConnectionChecker connectionChecker =
      InternetConnectionChecker();
  String? type;

  final ImagePicker picker = ImagePicker();
  XFile? selectedImage;
  void selectLogo({required ImageSource source}) async {
    selectedImage = await picker.pickImage(
      source: source,
    );
    if (selectedImage!.path.isNotEmpty) {
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

  registerCompany({
    required String idNumber,
    required String name,
    required String address,
  }) async {
    debugPrint(type);
    debugPrint(idNumber);
    debugPrint(address);

    emit(CompleteCompanyInfoLoading());
    if (await connectionChecker.hasConnection) {
      try {
        var myUrl = Uri.parse(
            "https://karam-app.com/celo/queencare/public/api/registercompany");
        final response = await http.post(myUrl, body: {
          'token': CacheHelper.getData(key: 'api_token'),
          'type': type,
          'address': address,
          'Id_number': idNumber,
          'name': name,
          'image': 'selected',
        });

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
      emit(DeviceNotConnectedState());
    }
  }
}
