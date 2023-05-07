import 'package:queen_care/core/utils/strings.dart';
import 'package:queen_care/network/local/cache_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';
class LanguageCacheHelper {
  Future<void> cacheLanguageCode(String languageCode) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("LOCALE", languageCode);
  }

  Future<String> getCachedLanguageCode() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final cachedLanguageCode = sharedPreferences.getString("LOCALE");
    if (cachedLanguageCode != null) {
      return cachedLanguageCode;
    } else {
      return "en";
    }
  }
}
