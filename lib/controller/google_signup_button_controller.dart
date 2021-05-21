import 'package:meus_carros/pages/authentication/provider/google_sign_in.dart';
import 'package:provider/provider.dart';

class GoogleSignupButtonController {

  void login(context) {
    final provider =
    Provider.of<GoogleSignInProvider>(context, listen: false);
    provider.login();
  }
}