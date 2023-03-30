
import 'modules/moduls.dart';
import 'utils/constant.dart';

void configureDependencies() {
  locator.registerSingleton<UserService>(UserService());
  locator.registerSingleton<APIService>(APIService()); //APIService
}
