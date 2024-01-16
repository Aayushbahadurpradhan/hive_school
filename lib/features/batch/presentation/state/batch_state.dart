import 'package:student_management_hive_api/features/batch/domain/entity/batch_entity.dart';

class BatchState {
  final bool isLoading;
  final List<BatchEntity> batches;
  final bool showMessage;
  final bool hasReachedMax;
  final int page;

  BatchState({
    required this.isLoading,
    required this.batches,
    required this.showMessage,
    required this.hasReachedMax,
    required this.page,
  });

  factory BatchState.initialState() => BatchState(
        isLoading: false,
        batches: [],
        showMessage: false,
        hasReachedMax: false,
        page: 0,
      );

  BatchState copyWith({
    bool? isLoading,
    List<BatchEntity>? batches,
    bool? showMessage,
    bool? hasReachedMax,
    int? page,
  }) {
    return BatchState(
      isLoading: isLoading ?? this.isLoading,
      batches: batches ?? this.batches,
      showMessage: showMessage ?? this.showMessage,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }
}
