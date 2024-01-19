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
    try {
      // Call the login method from the auth repository
      final loginResult = await _authRepository.loginStudent(username, password);

      // If login is successful (assuming the result is Either<Failure, bool>),
      // extract the boolean value and save the token using UserSharedPrefs
      return loginResult.fold(
        (failure) => left(failure),
        (isLoginSuccessful) async {
          if (isLoginSuccessful) {
            try {
              // Save the token (assuming it's a boolean)
              await _userSharedPrefs.setUserToken(isLoginSuccessful.toString());

              // Return success as true
              return right(true);
            } catch (e) {
              // Handle any exception during token saving
              return left(Failure(error: e.toString()));
            }
          } else {
            // If login is not successful, return failure
            return left(Failure(error: 'Login failed'));
          }
        },
      );
    } catch (e) {
      // Handle any other exceptions during login
      return left(Failure(error: e.toString()));
    }
  }
}
