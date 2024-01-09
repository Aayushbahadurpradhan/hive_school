import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management_hive_api/config/router/app_route.dart';
import 'package:student_management_hive_api/features/auth/domain/entity/auth_entity.dart';
import 'package:student_management_hive_api/features/auth/domain/use_case/auth_usecase.dart';
import 'package:student_management_hive_api/features/auth/domain/use_case/login_usecase.dart';
import 'package:student_management_hive_api/features/auth/domain/use_case/upload_image_usecase.dart';
import 'package:student_management_hive_api/features/auth/presentation/state/auth_state.dart';

final authViewModelProvider = StateNotifierProvider<AuthViewModel, AuthState>(
  (ref) => AuthViewModel(
    ref.read(uploadImageUseCaseProvider),
    ref.read(authUseCaseProvider),
    ref.read(loginUseCaseProvider)
  ),
);

class AuthViewModel extends StateNotifier<AuthState> {
  final UploadImageUseCase _uploadImageUsecase;
  final AuthUseCase _authUseCase;
  final LoginUseCase _loginUseCase;

  AuthViewModel(this._uploadImageUsecase, this._authUseCase, this._loginUseCase)
      : super(AuthState.initial());

  Future<void> uploadImage(File? file) async {
    state = state.copyWith(isLoading: true);
    var data = await _uploadImageUsecase.uploadProfilePicture(file!);
    data.fold(
      (l) {
        state = state.copyWith(isLoading: false, error: l.error);
      },
      (imageName) {
        state = state.copyWith(
          isLoading: false,
          error: null,
          imageName: imageName,
        );
      },
    );
  }

  Future<void> registerStudent(AuthEntity entity) async {
    state = state.copyWith(isLoading: true);
    final result = await _authUseCase.registerStudent(entity);
    state = state.copyWith(isLoading: false);
    result.fold(
      (failure) => state = state.copyWith(error: failure.error),
      (success) => state = state.copyWith(isLoading: false, showMessage: true),
    );
  }

  // //Login
  Future<void> loginStudent(
      BuildContext context, String username, String password) async {
    state = state.copyWith(isLoading: true);
    final result = await _loginUseCase.loginStudent(username, password);
    state = state.copyWith(isLoading: false);
    result.fold(
      (failure) => state = state.copyWith(
        error: failure.error,
        showMessage: true,
      ),
      (success) {
        state = state.copyWith(
          isLoading: false,
          showMessage: false,
          error: null,
        );

        Navigator.popAndPushNamed(context, AppRoute.homeRoute);
      },
    );
  }

  void reset() {
    state = state.copyWith(
      isLoading: false,
      error: null,
      imageName: null,
      showMessage: false,
    );
  }

  void resetMessage(bool value) {
    state = state.copyWith(showMessage: value);
  }
}
