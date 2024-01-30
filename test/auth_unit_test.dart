import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:student_management_hive_api/features/auth/domain/use_case/auth_usecase.dart';
import 'package:student_management_hive_api/features/auth/domain/use_case/login_usecase.dart';
import 'package:student_management_hive_api/features/auth/domain/use_case/upload_image_usecase.dart';
import 'package:student_management_hive_api/features/auth/presentation/view_model/auth_viewmodel.dart';

import 'auth_unit_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<LoginUseCase>(),
  MockSpec<AuthUseCase>(),
  MockSpec<UploadImageUseCase>(),
  MockSpec<BuildContext>(),
])
void main() {
  late LoginUseCase mockLoginUseCase;
  late AuthUseCase mockAuthUseCase;
  late UploadImageUseCase mockUploadImageUseCase;
  late ProviderContainer container;
  late BuildContext context;

  setUpAll(() {
    mockLoginUseCase = MockLoginUseCase();
    mockAuthUseCase = MockAuthUseCase();
    mockUploadImageUseCase = MockUploadImageUseCase();
    context = MockBuildContext();
    container = ProviderContainer(
      overrides: [
        authViewModelProvider.overrideWith(
          (ref) => AuthViewModel(
              mockUploadImageUseCase, mockAuthUseCase, mockLoginUseCase),
        ),
      ],
    );
  });
}
