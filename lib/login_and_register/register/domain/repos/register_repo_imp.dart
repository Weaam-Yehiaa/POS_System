import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:side_proj/admin_module/admin_screen.dart';
import 'package:side_proj/login_and_register/register/domain/repos/register_repo.dart';
import 'package:side_proj/shared/errors/failures_model.dart';

 class RegisterRepoImpl implements RegisterRepo{
  @override
   void  userRegister(String email,String password,BuildContext context)   {
    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
    ).then((value){
      log('RRRRegistration is done');
      log(value.user!.email.toString());
      //navigate to home as an admin
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const AdminScreen()),
      );
    }
    ).catchError((error){
      log('ERRORRRRRR$error');
      RegistrationFailure(error.toString());

    });
  }

}