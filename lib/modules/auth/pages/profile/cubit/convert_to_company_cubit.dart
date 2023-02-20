import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queen_care/network/local/cache_helper.dart';
import 'package:http/http.dart' as http;

part 'convert_to_company_state.dart';

class ConvertToCompanyCubit extends Cubit<ConvertToCompanyState> {
  ConvertToCompanyCubit() : super(ConvertToCompanyInitial());
  static ConvertToCompanyCubit get(context) => BlocProvider.of(context);
  bool isCompany = true;
  int? hasRegister;
  final List<String> typesList = ['شركة', 'محل تجاري ', 'سوبر ماركت', 'مول'];

  String type = 'شركة';
  void convertToCompany(String value) {
    value == typesList[0] ? isCompany = true : isCompany = false;
    type = value;
    emit(ConvertToCompanyChangeType());
  }

  void hasRegisterSelect(int value) {
    hasRegister = value;
    emit(ConvertToCompanyChangeType());
  }

  registerCompany({
    required String idNumber,
    required String address,
  }) async {
    debugPrint(idNumber);
    debugPrint(address);

    emit(ConvertToCompanyLoading());
    var myUrl = Uri.parse(
        "https://karam-app.com/celo/queencare/public/api/registercompany");

    final response = await http.post(myUrl, body: {
      'token': CacheHelper.getData(key: 'api_token'),
      'type': type,
      'address': address,
      'Id_number': idNumber,
    });

    debugPrint(response.statusCode.toString());

    if (response.statusCode == 201) {
      debugPrint(response.body);

      debugPrint('register company done !!!');
      CacheHelper.saveData(key: 'RoleId', value: '4');

      emit(ConvertToCompanySuccess());
    } else if (response.statusCode == 404) {
      emit(ConvertToCompanyError());
    }
  }
}
