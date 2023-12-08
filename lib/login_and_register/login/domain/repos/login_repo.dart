import 'package:flutter/cupertino.dart';

abstract class LoginRepo{
  void userLogin(String email,String password,BuildContext context);
  void signInWithGoogle();
}