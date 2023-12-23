import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:side_proj/models/item_model.dart';
import 'package:side_proj/shared/base_response_model.dart';
import '../../../../shared/constants.dart';

abstract class BaseAdminMenuRemoteData {
  Future<BaseResponse> addItemData({
    required Map<String, dynamic> query,
  });
  Future<void>fetchMenu();
  Future<BaseResponse> deleteItem({
    required Map<String, dynamic> query,
  });
  Future<BaseResponse> deleteCategory({
    required Map<String, dynamic> query,
  });
  Future<BaseResponse> editItem({
    required Map<String, dynamic> query,
  });
  Future<BaseResponse> editCategory({
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

  @override
  Future<BaseResponse> fetchMenu() async {
    BaseResponse baseResponse = BaseResponse();
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    var restaurant = users.doc(kRestaurantId);
    var menu = restaurant.collection('menu');
    var x =await users.get();
    x.docs.forEach((element) {
      log(element.id);
    });
    var allData=x.docs.map((doc) => doc.data()).toList();
    print(allData);
    // Get docs from collection reference
    var menuCategories=await menu.get();
    log('555555555''');
    log(menuCategories.docs.length.toString());
    for (var categoryDoc in menuCategories.docs) {
      if(categoryDoc.exists){
        QuerySnapshot items=categoryDoc.get('items');
        var itemsModels=items.docs.map((e) {
         if(e.exists)
           {
             log(e.metadata.toString());
           }
        },).toList();
      }
      else {
        log('Document in menuCategories does not exist');
      }
    }
    return baseResponse;
  }

  @override
  Future<BaseResponse> deleteCategory({required Map<String, dynamic> query}) {
    // TODO: implement deleteCategory
    throw UnimplementedError();
  }

  @override
  Future<BaseResponse> deleteItem({required Map<String, dynamic> query}) {
    // TODO: implement deleteItem
    throw UnimplementedError();
  }

  @override
  Future<BaseResponse> editCategory({required Map<String, dynamic> query}) {
    // TODO: implement editCategory
    throw UnimplementedError();
  }

  @override
  Future<BaseResponse> editItem({required Map<String, dynamic> query}) {
    // TODO: implement editItem
    throw UnimplementedError();
  }
}
