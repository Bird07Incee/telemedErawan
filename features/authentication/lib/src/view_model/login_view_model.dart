import 'package:commons/commons.dart';

class LoginProvider extends BaseViewModel {
  LoginProvider({required super.context});


  goAm(){
    replaceAll(Routes.ambulanceHome);
  }
}
