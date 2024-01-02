import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/failure/failure.dart';
import '../repository/batch_repository.dart';

final deleteBatchUsecaseProvider = Provider.autoDispose<DeleteBatchUsecase>(
      (ref) => DeleteBatchUsecase(repository: ref.read(batchRepositoryProvider)),
);

class DeleteBatchUsecase {
  final IBatchRepository repository;

  DeleteBatchUsecase({
    required this.repository,
  });

  Future<Either<Failure, bool>> deleteBatch(String batchId) async {
    return await repository.deleteBatch(batchId);
  }
}
