import 'dart:convert';
import 'package:geolocator/geolocator.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:queen_care/core/my_service.dart';
import 'package:queen_care/core/utils/strings.dart';
import 'package:queen_care/models/register_model.dart';
import 'package:queen_care/modules/auth/pages/register/cubit/register_states.dart';
import 'package:queen_care/network/local/cache_helper.dart';
import 'package:http/http.dart' as http;

import '../../../../../models/area.dart';
import '../../../../../models/city.dart';
import '../../../../../models/country.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);
  final InternetConnectionChecker connectionChecker =
      InternetConnectionChecker();
  int? genderGroupValue;
  DateTime? birthdayDateTime;
  final myService = MyService();
  final cityController = TextEditingController();
  final countryController = TextEditingController();
  final areaController = TextEditingController();

  bool visible = false;
  List<Country> countries = [];
  List<City> cities = [];
  List<Area> areas = [];
  late RegisterUserModel user;
  Country? selectedCountry;
  City? selectedCity;
  Area? selectedArea;
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

  void selectBirthdayDateTime(DateTime time) {
    birthdayDateTime = time;

    emit(SelectBirthDayState());
  }

  void selectGender(int index) {
    genderGroupValue = index;
    visible = false;

    emit((SelectGenderState()));
  }

  void check() {
    visible = true;
    emit(Cheeked());
  }

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

  registerUser({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String gender,
    required String address,
    required String phone,
  }) async {
    emit(RegisterLoadingState());
    if (await connectionChecker.hasConnection) {
      if(position==null){
        getLocation();
      }else{
        try {

          var myUrl = Uri.parse("$baseUrl/Register");
          debugPrint('birthday is');

          debugPrint(selectedCountry!.name);
          debugPrint(selectedCity!.name);
          debugPrint(selectedArea!.name);

          final response = await http.post(myUrl, body: {
            'firstName': firstName,
            'lastName': lastName,
            'email': email,
            'phone': phone,
            'password': password,
            'gender': gender,
            'city': selectedCity!.name,
            'area': selectedArea!.name,
            'country': selectedCountry!.name,
            'address': address,
            'birthday': birthdayDateTime.toString(),
            'fcm,': 'fcm',
            'x': position!.latitude.toString(),
            'y': position!.latitude.toString()
          });

          debugPrint(response.statusCode.toString());
          var data = json.decode(response.body);

          if (response.statusCode == 200) {
            debugPrint(response.statusCode.toString());

            user = RegisterUserModel.fromJson(data);
            debugPrint(user.firstName);
            debugPrint(user.email);
            debugPrint(user.phone);
            debugPrint(user.lastName);
            debugPrint(user.toString());
            debugPrint(user.apiToken);
            CacheHelper.saveData(key: 'name', value: user.firstName);
            CacheHelper.saveData(key: 'address', value: user.address);
            CacheHelper.saveData(key: 'api_token', value: user.apiToken);
            CacheHelper.saveData(key: 'type', value: '0');

            emit(RegisterSuccessState(user: user));
          } else if (response.statusCode == 403) {
            emit(NumberUsedState(error: data['body']));
          } else if (response.statusCode == 404) {
            emit(RegisterErrorState(error: data['body']));
          }
        } catch (e) {
          if (kDebugMode) {
            print(e.toString());
          }
          emit(ErrorState());
        }
      }

    } else {
      emit(DeviceNotConnectedState());
    }
  }

  Future<List<Country>> getCountries() async {
    emit(LoadingState());
    if (await connectionChecker.hasConnection) {
      try {
        var myUrl = Uri.parse("$baseUrl/country");

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
        var myUrl = Uri.parse("$baseUrl/city");

        final response =
            await http.post(myUrl, body: {'country_id': countryId.toString()});

        if (response.statusCode == 200) {
          cities = cityFromJson(response.body);
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
        var myUrl = Uri.parse("$baseUrl/area");

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
}
