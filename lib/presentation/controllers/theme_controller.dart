
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kids_puzzle/app/util/app_constansts.dart';

class ThemeController extends GetxController implements GetxService {
  final GetStorage? sharedPreferences;
  ThemeController({ this.sharedPreferences}) {
    _loadCurrentTheme();
  }

  bool _darkTheme = false;
  bool get darkTheme => _darkTheme;

  void toggleTheme() {
    _darkTheme = !_darkTheme;
    sharedPreferences!.write(AppConstants.THEME, _darkTheme);
    update();
  }

  void _loadCurrentTheme() async {
    _darkTheme = sharedPreferences!.read(AppConstants.THEME) ?? false;
    update();
  }
}