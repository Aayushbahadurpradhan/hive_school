import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:student_management_hive_api/features/batch/domain/use_case/add_batch_usecase.dart';
import 'package:student_management_hive_api/features/batch/domain/use_case/delete_batch_usecase.dart';
import 'package:student_management_hive_api/features/batch/domain/use_case/get_all_batches_usecase.dart';
import 'package:student_management_hive_api/features/batch/presentation/view_model/batch_view_model.dart';

import 'auth_unit_test.mocks.dart';
import 'batch_unit_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<AddBatchUsecase>(),
  MockSpec<GetAllBatchesUsecase>(),
  MockSpec<DeleteBatchUsecase>(),
])
void main() {
  late AddBatchUsecase mockAddBatchUsecase;
  late GetAllBatchesUsecase mockGetAllBatchesUsecase;
  late DeleteBatchUsecase mockDeleteBatchUsecase;
  late ProviderContainer container;
  late BuildContext context;

  setUpAll(
    () {
      mockAddBatchUsecase = MockAddBatchUsecase();
      mockGetAllBatchesUsecase = MockGetAllBatchesUsecase();
      mockDeleteBatchUsecase = MockDeleteBatchUsecase();
      context = MockBuildContext();
      container = ProviderContainer(
        overrides: [
          batchViewModelProvider.overrideWith((ref) =>BatchViewModel(addBatchUsecase: mockAddBatchUsecase, getAllBatchesUsecase: mockGetAllBatchesUsecase, deleteBatchUsecase: mockDeleteBatchUsecase))
        ]
      );
    }
  );
}
