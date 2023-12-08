import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:side_proj/login_and_register/register/data/register_local_data_source.dart';
import 'package:side_proj/models/user_model.dart';

abstract class RegisterRemoteDataSource{
  Future<void> createUser({
    required String name,
    required String email,
    String role='admin',
  });

}
class RegisterRemoteDataSourceImpl extends RegisterRemoteDataSource{
  @override
  Future<void> createUser({
    required String name,
    required String email,
    String role = 'admin'
  }) async {
    RegisterLocalDataSourceImpl registerLocalDataSourceImpl=RegisterLocalDataSourceImpl();
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    var restaurant= users.doc();
    var staff=restaurant.collection('staff');
    var member=staff.doc();
   UserModel model= UserModel(email, name,role, restaurant.id, member.id);
    member.set(model.toMap());


    //cashing data
    registerLocalDataSourceImpl.savingLocalData(restaurantID: restaurant.id, uId: member.id);

  }

}