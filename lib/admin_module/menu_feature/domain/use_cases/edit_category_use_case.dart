import 'package:side_proj/shared/base_response_model.dart';
import 'package:side_proj/shared/errors/failures_model.dart';

import '../repos/base_admin_menu _repo.dart';
import 'package:dartz/dartz.dart';

class EditCategoryUseCase {
  final BaseAdminMenuRepo _baseAdminMenuRepo;

  EditCategoryUseCase(this._baseAdminMenuRepo);

  Future<Either<Failure, BaseResponse>> call(Map<String, dynamic> query) =>
      _baseAdminMenuRepo.editCategory(query: query);
}
