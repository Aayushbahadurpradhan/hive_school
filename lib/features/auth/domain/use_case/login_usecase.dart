// import 'package:dartz/dartz.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:student_management_hive_api/core/failure/failure.dart';
// import 'package:student_management_hive_api/features/auth/domain/repository/auth_repository.dart';

// final loginUseCaseProvider = Provider.autoDispose<LoginUseCase>(
//   (ref) => LoginUseCase(ref.watch(authRepositoryProvider)),
// );

// class LoginUseCase {
//   final IAuthRepository _authRepository;

//   LoginUseCase(this._authRepository);

//   Future<Either<Failure, bool>> loginStudent(
//     String username,
//     String password,
//   ) async {
//     return await _authRepository.loginStudent(username, password);
//   }
// }

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management_hive_api/core/failure/failure.dart';
import 'package:student_management_hive_api/core/shared_prefs/user_shared_prefs.dart';
import 'package:student_management_hive_api/features/auth/domain/repository/auth_repository.dart';

final loginUseCaseProvider = Provider.autoDispose<LoginUseCase>(
  (ref) => LoginUseCase(
    ref.watch(authRepositoryProvider),
    ref.watch(userSharedPrefsProvider),
  ),
);

class LoginUseCase {
  final IAuthRepository _authRepository;
  final UserSharedPrefs _userSharedPrefs;

  LoginUseCase(this._authRepository, this._userSharedPrefs);

  Future<Either<Failure, bool>> loginStudent(
    String username,
    String password,
  ) async {
    // return await _authRepository.loginStudent(username, password);
    final loginResult = await _authRepository.loginStudent(username, password);
    return loginResult.fold(
      (failure) => left(failure),
      (success) async {
        try {
          final token = success as String;
          await _userSharedPrefs.setUserToken(token);
          return await _authRepository.loginStudent(username, password);
        } catch (e) {
          return left(Failure(error: e.toString()));
        }
      },
    );
  }
}
