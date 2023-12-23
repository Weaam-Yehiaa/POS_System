import 'package:dartz/dartz.dart';
import 'package:side_proj/shared/base_response_model.dart';
import 'package:side_proj/shared/errors/failures_model.dart';

import '../repos/base_admin_menu _repo.dart';

class FetchMenuUseCase {
  final BaseAdminMenuRepo _baseAdminMenuRepo;

  FetchMenuUseCase(this._baseAdminMenuRepo);

  Future<Either<Failure, BaseResponse>> call() =>
      _baseAdminMenuRepo.fetchMenu();
}
