// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:student_management_hive_api/core/failure/failure.dart';
// import 'package:student_management_hive_api/features/batch/domain/entity/batch_entity.dart';

// final BatchRemoteDatasourceProvider =
//     Provider.autoDispose<BatchRemoteDataSource>(
//         (ref) => BatchRemoteDataSource());

// class BatchRemoteDataSource {
  
//   Future<Either<Failure, List<BatchEntity>>> getAllBatches() async {
//     try {
//       List<BatchEntity> lstBatchEntity = [
//         const BatchEntity(batchId: '1', batchName: 'A'),
//         const BatchEntity(batchId: '2', batchName: 'B'),
//         const BatchEntity(batchId: '3', batchName: 'C'),
//         const BatchEntity(batchId: '4', batchName: 'D')
//       ];
//       return Right(lstBatchEntity);
//     } catch (e) {
//       return Left(Failure(error: "error"));
//     }
//   }
// }



import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management_hive_api/config/constants/api_endpoint.dart';
import 'package:student_management_hive_api/core/failure/failure.dart';
import 'package:student_management_hive_api/core/network/http_service.dart';
import 'package:student_management_hive_api/features/batch/data/dto/get_all_batch_dto.dart';
import 'package:student_management_hive_api/features/batch/data/model/batch_api_model.dart';
import 'package:student_management_hive_api/features/batch/domain/entity/batch_entity.dart';

final batchRemoteDatasourceProvider =
    Provider.autoDispose<BatchRemoteDatSource>(
  (ref) => BatchRemoteDatSource(
    dio: ref.read(httpServiceProvider),
  ),
);

class BatchRemoteDatSource {
  final Dio dio;

  BatchRemoteDatSource({required this.dio});

  Future<Either<Failure, List<BatchEntity>>> getAllBatches() async {
    try {
      var response = await dio.get(ApiEndpoints.getAllBatch);
      if (response.statusCode == 200) {
       
        GetAllBatchDTO batchAddDTO = GetAllBatchDTO.fromJson(response.data);
        // Convert BatchAPIModel to BatchEntity
        List<BatchEntity> batchList = batchAddDTO.data
            .map((batch) => BatchAPIModel.toEntity(batch))
            .toList();

        return Right(batchList);
      } else {
        return Left(
          Failure(
            error: response.statusMessage.toString(),
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      return Left(Failure(error: e.response?.data['message']));
    }
  }
}