import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management_hive_api/core/failure/failure.dart';
import 'package:student_management_hive_api/core/network/hive_service.dart';
import 'package:student_management_hive_api/features/auth/data/model/auth_hive_model.dart';
import 'package:student_management_hive_api/features/auth/domain/entity/auth_entity.dart';

final authLocalDataSourceProvider = Provider(
  (ref) => AuthLocalDataSource(
    ref.read(hiveServiceProvider),
    ref.read(authHiveModelProvider),
  ),
);

class AuthLocalDataSource {
  final HiveService _hiveService;
  final AuthHiveModel _authHiveModel;

  AuthLocalDataSource(this._hiveService, this._authHiveModel);

  Future<Either<Failure, bool>> registerStudent(AuthEntity student) async {
    try {
      await _hiveService.addStudent(_authHiveModel.toHiveModel(student));
      return const Right(true);
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }

  Future<Either<Failure, bool>> loginStudent(
    String username,
    String password,
  ) async {
    try {
      AuthHiveModel? students = await _hiveService.login(username, password);
      if (students == null) {
        return Left(Failure(error: 'Username or password is wrong'));
      } else {
        return const Right(true);
      }
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }
}
