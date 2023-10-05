import 'core/data_base_helper.dart';
import 'data/database/data_base_helper_imp.dart';
import 'main.dart';

class Initializer {
  Initializer() {
    getIt.registerSingleton<DataBaseHelper>(DataBaseHelperImp());
  }

  DataBaseHelper getDataBase() => getIt.get<DataBaseHelper>();
}
