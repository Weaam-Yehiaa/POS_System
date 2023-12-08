import 'package:flutter/cupertino.dart';

abstract class RegisterRepo{
   void userRegister(String email,String password,BuildContext context);
 // Future<Either<Failure,void>>user_register();
}