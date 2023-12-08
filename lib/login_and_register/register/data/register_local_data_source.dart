import '../../../models/user_model.dart';
import '../../../shared/methods.dart';

abstract class RegisterLocalDataSource{
  Future<void> savingLocalData({
   required String restaurantID,
   required String uId,
  });
}
class RegisterLocalDataSourceImpl extends RegisterLocalDataSource{
  @override
  Future<void> savingLocalData({required String restaurantID, required String uId}) async {

    UserModel userData = await getUserData(restaurantID: restaurantID,uId: uId);
    cachingData(userData);

  }


  
}