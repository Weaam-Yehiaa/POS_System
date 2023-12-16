import 'package:dartz/dartz.dart';

import '../../../../shared/base_response_model.dart';
import '../../../../shared/errors/failures_model.dart';

abstract class BaseAdminMenuRepo {
  Future<Either<Failure,BaseResponse>>  addItem({
    required Map<String, dynamic> query,
  });

  void deleteItem();

  void deleteCategory();

  void editItem();

  void editCategory();
}
