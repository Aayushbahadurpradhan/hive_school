import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management_hive_api/features/batch/domain/entity/batch_entity.dart';
import 'package:student_management_hive_api/features/batch/domain/use_case/add_batch_usecase.dart';
import 'package:student_management_hive_api/features/batch/presentation/state/batch_state.dart';
import '../../domain/use_case/delete_batch_usecase.dart';
import '../../domain/use_case/get_all_batches_usecase.dart';

// View model ma kaile pani build context use na garne

final batchViewModelProvider =
    StateNotifierProvider.autoDispose<BatchViewModel, BatchState>(
  (ref) => BatchViewModel(
    addBatchUsecase: ref.read(addBatchUsecaseProvider),
    getAllBatchesUsecase: ref.read(getAllBatchesUsecaseProvider),
    deleteBatchUsecase: ref.watch(deleteBatchUsecaseProvider),

  ),
);

class BatchViewModel extends StateNotifier<BatchState> {
  final AddBatchUsecase addBatchUsecase;
  final GetAllBatchesUsecase getAllBatchesUsecase;
  final DeleteBatchUsecase deleteBatchUsecase;

  BatchViewModel({
    required this.addBatchUsecase,
    required this.getAllBatchesUsecase,
    required this.deleteBatchUsecase,
  }) : super(BatchState.initialState()) {
    getAllBatches();
  }

  void addBatch(BatchEntity batch) {
    state = state.copyWith(isLoading: true);

    addBatchUsecase.addBatch(batch).then((value) {
      value.fold(
        (failure) => state = state.copyWith(isLoading: false),
        (success) {
          state = state.copyWith(isLoading: false, showMessage: true);
          getAllBatches();
        },
      );
    });
  }

  void getAllBatches() {
    state = state.copyWith(isLoading: true);
    getAllBatchesUsecase.getAllBatches().then((value) {
      value.fold(
        (failure) => state = state.copyWith(isLoading: false),
        (batches) {
          state = state.copyWith(isLoading: false, batches: batches);
        },
      );
    });
  }

  void deleteBatch(String batchId) {
    state = state.copyWith(isLoading: true);

    deleteBatchUsecase.deleteBatch(batchId).then((value) {
      value.fold(
            (failure) {
          state = state.copyWith(isLoading: false);
        },
            (success) {
          state = state.copyWith(isLoading: true);
          getAllBatches();
        },
      );
    });
  }

  void resetMessage(bool value) {
    state = state.copyWith(showMessage: value);
  }
}
