import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:side_proj/models/item_model.dart';
import 'package:side_proj/shared/base_response_model.dart';

import '../../../../shared/constants.dart';

abstract class BaseAdminMenuRemoteData {
  Future<void> addItemData({
    required Map<String, dynamic> query,
  });
}

class AdminMenuRemoteDataImpl extends BaseAdminMenuRemoteData {

  @override
  Future<BaseResponse> addItemData({
    required Map<String, dynamic> query,
  }) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    var restaurant = users.doc(kRestaurantId);
    var menu = restaurant.collection('menu');
    var category = menu.doc(query['categoryId']);
    var items = category.collection('items');
    var item = items.doc(query['itemName']);
    ItemModel model = ItemModel(query['itemName'], query['itemPrice'],
        kRestaurantId, query['categoryId'], item.id);
    BaseResponse baseResponse = BaseResponse();

    item.set(model.toMap()).then((value) {
      baseResponse.code = 200;
      baseResponse.description = 'success, item is added';
    }).catchError((error) {
      baseResponse.code = 500;
      baseResponse.description = error;
    });

    return baseResponse;
  }
}
