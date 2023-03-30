import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:queen_care/core/my_service.dart';
import 'package:queen_care/models/area.dart';
import 'package:queen_care/models/city.dart';
import 'package:queen_care/models/country.dart';
import 'package:queen_care/models/user.dart';
import 'package:queen_care/modules/auth/pages/profile/cubit/profile_states.dart';
import 'package:queen_care/network/local/cache_helper.dart';

import 'package:http/http.dart' as http;

class ProfileCubit extends Cubit<ProfileCubitState> {
  ProfileCubit() : super(ProfileCubitInitial());
  static ProfileCubit get(context) => BlocProvider.of(context);
  int? genderGroupValue;
  UserModel? user;
  DateTime? birthdayDateTime;
  MyService myService = MyService();
  List<Country> countries = [];
  List<City> cities = [];
  List<Area> areas = [];
  Country? selectedCountry;
  City? selectedCity;
  Area? selectedArea;
  final cityController = TextEditingController();
  final countryController = TextEditingController();
  final areaController = TextEditingController();
  selectCountry(Country country) {
    selectedCountry = country;
    cities = [];
    areas = [];
    selectedCity = null;
    selectedArea = null;
    cityController.text = '';
    areaController.text = '';
    countryController.text = country.name;

    emit(SelectCountryState(country));
    getCities(countryId: country.id);
  }

  selectCity(City city) {
    selectedCity = city;
    areas = [];
    selectedArea = null;
    cityController.text = city.name;
    areaController.text = '';
    emit(SelectCityState());
    getAreas(cityId: city.id);
  }

  selectArea(Area area) {
    selectedArea = area;

    areaController.text = area.name;

    emit(SelectAreaState());
  }

  Future<List<Country>> getCountries() async {
    emit(LoadingState());
    if (await connectionChecker.hasConnection) {
      try {
        var myUrl = Uri.parse(
            "https://karam-app.com/celo/queencare/public/api/country");

        final response = await http.get(
          myUrl,
        );

        if (response.statusCode == 200) {
          countries = countryFromJson(response.body);
          emit(LoadedSuccess());
        } else if (response.statusCode == 404) {
          emit(LoadingErrorState());
        }
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
        emit(LoadingErrorState());
      }
    } else {
      emit(DeviceNotConnectedState());
    }
    return countries;
  }

  Future<List<City>> getCities({required int countryId}) async {
    emit(LoadingState());
    if (await connectionChecker.hasConnection) {
      try {
        var myUrl =
            Uri.parse("https://karam-app.com/celo/queencare/public/api/city");

        final response =
            await http.post(myUrl, body: {'country_id': countryId.toString()});

        if (response.statusCode == 200) {
          cities = cityFromJson(response.body);
          cityController.text = user!.city;
          if (kDebugMode) {
            print(cities);
          }
          emit(LoadedSuccess());
        } else if (response.statusCode == 404) {
          emit(LoadingErrorState());
        }
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
        emit(LoadingErrorState());
      }
    } else {
      emit(DeviceNotConnectedState());
    }
    return cities;
  }

  Future<List<Area>> getAreas({required int cityId}) async {
    emit(LoadingState());
    if (await connectionChecker.hasConnection) {
      try {
        var myUrl =
            Uri.parse("https://karam-app.com/celo/queencare/public/api/area");

        final response =
            await http.post(myUrl, body: {'city_id': cityId.toString()});

        if (response.statusCode == 200) {
          areas = areaFromJson(response.body);
          emit(LoadedSuccess());
        } else if (response.statusCode == 404) {
          emit(LoadingErrorState());
        }
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
        emit(LoadingErrorState());
      }
    } else {
      emit(DeviceNotConnectedState());
    }
    return areas;
  }

  final InternetConnectionChecker connectionChecker =
      InternetConnectionChecker();
  getProfileWithHttp() async {
    emit(GetProfileLoading());
    if (await connectionChecker.hasConnection) {
      try {
        var myUrl = Uri.parse(
            "https://karam-app.com/celo/queencare/public/api/profile");

        final response = await http.post(myUrl, body: {
          'token': CacheHelper.getData(key: 'api_token'),
        });

        var data = json.decode(response.body);

        if (response.statusCode == 200) {
          debugPrint(data.toString());
          debugPrint(response.statusCode.toString());
          user = UserModel.fromJson(data);
          genderGroupValue = int.parse(user!.gender);
          debugPrint(response.body);
          debugPrint('data : ${data["api_token"]}');
          debugPrint(user!.birthday.toString());

          emit(GetProfileLoaded(user!));
        } else if (response.statusCode == 404) {
          emit(GetProfileError(error: 'Error'));
        }
      } catch (e) {
        debugPrint(e.toString());
        emit(GetProfileError(error: 'Error'));
      }
    } else {
      emit(DeviceNotConnectedState());
    }
  }

  void selectGender(int index) {
    genderGroupValue = index;
    debugPrint(index.toString());
    emit((SelectGenderState()));
  }

  void selectBirthdayDateTime(DateTime time) {
    birthdayDateTime = time;

    emit(SelectBirthDayState());
  }

  editeProfileWithHttp({
    required String firstName,
    required String lastName,
    required String phone,
    required String email,
    required String gender,
    required String address,
  }) async {
    emit(EditeProfileLoading());
    if (await connectionChecker.hasConnection) {
      try {
        debugPrint('gender');
        debugPrint(gender);
        var myUrl = Uri.parse(
            "https://karam-app.com/celo/queencare/public/api/update-profile");

        final response = await http.post(myUrl, body: {
          'token': CacheHelper.getData(key: 'api_token'),
          'firstName': firstName.isEmpty ? user!.firstName : firstName,
          'lastName': lastName.isEmpty ? user!.lastName : lastName,
          'phone': phone.isEmpty ? user!.phone : phone,
          'email': email.isEmpty ? user!.email : email,
          'gender': gender.isEmpty ? user!.gender : gender.toString(),
          'city': selectedCity == null ? user!.city : selectedCity!.name,
          'area': selectedArea == null ? user!.area : selectedArea!.name,
          'country':
              selectedCountry == null ? user!.area : selectedCountry!.name,
          'address': address.isEmpty ? user!.address : address,
          'birthday': birthdayDateTime.toString() == 'null'
              ? user!.birthday.toString()
              : birthdayDateTime.toString(),
        });

        debugPrint(response.statusCode.toString());

        if (response.statusCode == 200) {
          debugPrint('update user done !!!');

          emit(EditeProfileSuccess(user!));
        } else if (response.statusCode == 404) {
          emit(EditeProfileError(error: 'Error'));
        }
      } catch (e) {
        emit(EditeProfileError(error: 'Error'));
      }
    } else {
      emit(DeviceNotConnectedToSendState());
    }
  }
}
