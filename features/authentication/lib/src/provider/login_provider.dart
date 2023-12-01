import 'package:commons/commons.dart';

class LoginProvider extends BaseProvider {
  LoginProvider({required super.context});


  goAm(){
    replaceAll(Routes.ambulanceHome);
  }
}
