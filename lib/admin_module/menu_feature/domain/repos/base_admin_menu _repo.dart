import 'package:dartz/dartz.dart';

import '../../../../shared/base_response_model.dart';
import '../../../../shared/errors/failures_model.dart';

abstract class BaseAdminMenuRepo {
  Future<Either<Failure, BaseResponse>> addItem({
    required Map<String, dynamic> query,
  });

  Future<Either<Failure, BaseResponse>> fetchMenu();

  Future<Either<Failure, BaseResponse>> deleteItem({
    required Map<String, dynamic> query,
  });

  Future<Either<Failure, BaseResponse>> deleteCategory({
    required Map<String, dynamic> query,
  });

  Future<Either<Failure, BaseResponse>> editItem({
    required Map<String, dynamic> query,
  });

  Future<Either<Failure, BaseResponse>> editCategory({
    required Map<String, dynamic> query,
  });
}
