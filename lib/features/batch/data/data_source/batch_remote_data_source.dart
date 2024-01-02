import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management_hive_api/core/failure/failure.dart';
import 'package:student_management_hive_api/features/batch/domain/entity/batch_entity.dart';
final BatchRemoteDatasourceProvider = Provider.autoDispose<BatchRemoteDataSource>
  ((ref) => BatchRemoteDataSource());
 
class BatchRemoteDataSource{
  Future<Either<Failure,List<BatchEntity>>>getAllBatches()async{
    try{
      List<BatchEntity> lstBatchEntity=[
        const BatchEntity(batchId: '1', batchName: 'A'),
        const BatchEntity(batchId: '2', batchName: 'B'),
        const BatchEntity(batchId: '3', batchName: 'C'),
        const BatchEntity(batchId: '4', batchName: 'D')

      ];
      return Right(lstBatchEntity);
    }catch(e){
      return Left(Failure(error:"error"));
    }
  }
}