import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:side_proj/admin_module/menu_feature/data/data_source/admin_feature_remote_data.dart';
import 'package:side_proj/admin_module/menu_feature/domain/repos/base_admin_menu%20_repo.dart';
import 'package:side_proj/shared/base_response_model.dart';
import 'package:side_proj/shared/errors/failures_model.dart';

class AdminMenuRepo extends BaseAdminMenuRepo {
  final AdminMenuRemoteDataImpl _adminMenuRemoteDataImpl;

  AdminMenuRepo(this._adminMenuRemoteDataImpl);

  @override
  Future<Either<Failure, BaseResponse>> addItem(
      {required Map<String, dynamic> query,}) async {
    try{
      final result=await _adminMenuRemoteDataImpl.addItemData(query: query);
      return Right(result);
    }on ServerFailure catch (failure){
      log(failure.errorMessage);
      return Left(ServerFailure(failure.errorMessage));
    }

  }

  @override
  void deleteCategory() {
    // TODO: implement deleteCategory
  }

  @override
  void deleteItem() {
    // TODO: implement deleteItem
  }

  @override
  void editCategory() {
    // TODO: implement editCategory
  }

  @override
  void editItem() {
    // TODO: implement editItem
  }
}
