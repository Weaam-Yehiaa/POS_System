import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

import '../../../../shared/constants.dart';
import '../../data/admin_staff_remote_data.dart';
import 'admin_staff_repo.dart';

class AdminStaffRepoImpl extends AdminStaffRepo {
  @override
  void addMember({
    required String email,
    required String password,
    required String role,

  }) {


    makeAccount(email, password,role);
  }
}
void  makeAccount(String email,String password,String role)   {
  FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: email,
    password: password,
  ).then((value){
    log('RRRRegistration is done');
    log(value.user!.email.toString());
    //Add Data to fireStore
    AdminStaffRemoteDataImpl adminStaffRemoteDataImpl=AdminStaffRemoteDataImpl();
    adminStaffRemoteDataImpl.createUser(name: kName, email: email,role: role);
  }
  ).catchError((error){
    log('ERRORRRRRR$error');
  });
}