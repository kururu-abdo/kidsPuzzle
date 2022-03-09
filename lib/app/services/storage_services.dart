import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageService extends GetxService {
  String? languageCode;
  bool?  theme;
  Future<StorageService> init() async {
    await GetStorage.init();
    languageCode = await GetStorage().read('lang');
    theme=await GetStorage().read('theme')??false;
    return this;
  }

  void write(String key, dynamic value) {
    GetStorage().write(key, value);
  }
}