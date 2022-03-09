import 'package:kids_puzzle/app/util/images.dart';
import 'package:kids_puzzle/domain/core/model/language_model.dart';

class AppConstants {



  // Shared Key
  static const String THEME = 'theme';
  static const String LANGUAGE_CODE = 'lang';




    static List<LanguageModel> languages = [
 
    LanguageModel(
        imageUrl: Images.arabic,
        languageName: 'Arabic',
        countryCode: 'SA',
        languageCode: 'ar'),
           LanguageModel(
        imageUrl: Images.english,
        languageName: 'English',
        countryCode: 'US',
        languageCode: 'en'),
  ];
}