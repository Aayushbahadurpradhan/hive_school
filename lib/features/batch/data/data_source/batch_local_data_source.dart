import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management_hive_api/core/failure/failure.dart';
import 'package:student_management_hive_api/features/batch/domain/entity/batch_entity.dart';

import '../../../../core/network/hive_service.dart';
import '../model/batch_hive_model.dart';

final batchLocalDatasourceProvider = Provider<BatchLocalDataSource>((ref) {
  return BatchLocalDataSource(
      hiveService: ref.read(hiveServiceProvider),
      batchHiveModel: ref.read(batchHiveModelProvider));
});

class BatchLocalDataSource {
  final HiveService hiveService;
  final BatchHiveModel batchHiveModel;

  BatchLocalDataSource({
    required this.hiveService,
    required this.batchHiveModel,
  });

  // Add Batch
  Future<Either<Failure, bool>> addBatch(BatchEntity batch) async {
  //   try {
  //     // Convert BatchEntity to BatchHiveModel
  //     BatchHiveModel batchHiveModel = BatchHiveModel.toHiveModel(batch);
  //     hiveService.addBatch(batchHiveModel);
  //     return const Right(true);
  //   } catch (e) {
  //     return Left(Failure(error: e.toString()));
  //   }
  // }
    try {
      // Convert Entity to Hive Object
      final hiveBatch = batchHiveModel.toHiveModel(batch);
      // Add to Hive
      await hiveService.addBatch(hiveBatch);
      return const Right(true);
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }
  Future<Either<Failure, List<BatchEntity>>> getAllBatches() async {
  //   try {
  //     List<BatchHiveModel> batches = await hiveService.getAllBatches();
  //     // Convert Hive Object to Entity
  //     List<BatchEntity> batchEntities =
  //     batches.map((e) => BatchHiveModel.toEntity(e)).toList();
  //     return Right(batchEntities);
  //   } catch (e) {
  //     return Left(Failure(error: e.toString()));
  //   }
  // }
      try {
      // Get all batches from Hive
      final batches = await hiveService.getAllBatches();
      // Convert Hive Object to Entity
      final batchEntities = batchHiveModel.toEntityList(batches);
      return Right(batchEntities);
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }

  Future<Either<Failure, bool>> deleteBatch(String batchId) async {
    try {
      await hiveService.deleteBatch(batchId);
      return const Right(true); // Indicate success
    } catch (e) {
      return Left(Failure(error: e.toString())); // Indicate failure with an error message
    }
  }



}
