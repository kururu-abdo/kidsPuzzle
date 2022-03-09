
import 'dart:ffi';

import 'package:kids_puzzle/app/core/usecases/params_usecase.dart';
import 'package:kids_puzzle/domain/core/repository/local_repo.dart';

class ChangeLanguageUseCase extends ParamUseCase<Void , String> {
  final LocaleRepo? _repo;
  ChangeLanguageUseCase(this._repo);

  @override
  void execute(String langCode) {
      _repo!.changeLanguage(langCode);
  }
}