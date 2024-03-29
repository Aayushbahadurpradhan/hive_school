// Mocks generated by Mockito 5.4.4 from annotations
// in student_management_hive_api/test/batch_unit_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:dartz/dartz.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;
import 'package:student_management_hive_api/core/failure/failure.dart' as _i6;
import 'package:student_management_hive_api/features/batch/domain/entity/batch_entity.dart'
    as _i7;
import 'package:student_management_hive_api/features/batch/domain/repository/batch_repository.dart'
    as _i2;
import 'package:student_management_hive_api/features/batch/domain/use_case/add_batch_usecase.dart'
    as _i4;
import 'package:student_management_hive_api/features/batch/domain/use_case/delete_batch_usecase.dart'
    as _i9;
import 'package:student_management_hive_api/features/batch/domain/use_case/get_all_batches_usecase.dart'
    as _i8;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeIBatchRepository_0 extends _i1.SmartFake
    implements _i2.IBatchRepository {
  _FakeIBatchRepository_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEither_1<L, R> extends _i1.SmartFake implements _i3.Either<L, R> {
  _FakeEither_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [AddBatchUsecase].
///
/// See the documentation for Mockito's code generation for more information.
class MockAddBatchUsecase extends _i1.Mock implements _i4.AddBatchUsecase {
  @override
  _i2.IBatchRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeIBatchRepository_0(
          this,
          Invocation.getter(#repository),
        ),
        returnValueForMissingStub: _FakeIBatchRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.IBatchRepository);

  @override
  _i5.Future<_i3.Either<_i6.Failure, bool>> addBatch(_i7.BatchEntity? batch) =>
      (super.noSuchMethod(
        Invocation.method(
          #addBatch,
          [batch],
        ),
        returnValue: _i5.Future<_i3.Either<_i6.Failure, bool>>.value(
            _FakeEither_1<_i6.Failure, bool>(
          this,
          Invocation.method(
            #addBatch,
            [batch],
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<_i3.Either<_i6.Failure, bool>>.value(
                _FakeEither_1<_i6.Failure, bool>(
          this,
          Invocation.method(
            #addBatch,
            [batch],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, bool>>);
}

/// A class which mocks [GetAllBatchesUsecase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetAllBatchesUsecase extends _i1.Mock
    implements _i8.GetAllBatchesUsecase {
  @override
  _i2.IBatchRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeIBatchRepository_0(
          this,
          Invocation.getter(#repository),
        ),
        returnValueForMissingStub: _FakeIBatchRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.IBatchRepository);

  @override
  _i5.Future<_i3.Either<_i6.Failure, List<_i7.BatchEntity>>> getAllBatches() =>
      (super.noSuchMethod(
        Invocation.method(
          #getAllBatches,
          [],
        ),
        returnValue:
            _i5.Future<_i3.Either<_i6.Failure, List<_i7.BatchEntity>>>.value(
                _FakeEither_1<_i6.Failure, List<_i7.BatchEntity>>(
          this,
          Invocation.method(
            #getAllBatches,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<_i3.Either<_i6.Failure, List<_i7.BatchEntity>>>.value(
                _FakeEither_1<_i6.Failure, List<_i7.BatchEntity>>(
          this,
          Invocation.method(
            #getAllBatches,
            [],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, List<_i7.BatchEntity>>>);
}

/// A class which mocks [DeleteBatchUsecase].
///
/// See the documentation for Mockito's code generation for more information.
class MockDeleteBatchUsecase extends _i1.Mock
    implements _i9.DeleteBatchUsecase {
  @override
  _i2.IBatchRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeIBatchRepository_0(
          this,
          Invocation.getter(#repository),
        ),
        returnValueForMissingStub: _FakeIBatchRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.IBatchRepository);

  @override
  _i5.Future<_i3.Either<_i6.Failure, bool>> deleteBatch(String? batchId) =>
      (super.noSuchMethod(
        Invocation.method(
          #deleteBatch,
          [batchId],
        ),
        returnValue: _i5.Future<_i3.Either<_i6.Failure, bool>>.value(
            _FakeEither_1<_i6.Failure, bool>(
          this,
          Invocation.method(
            #deleteBatch,
            [batchId],
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<_i3.Either<_i6.Failure, bool>>.value(
                _FakeEither_1<_i6.Failure, bool>(
          this,
          Invocation.method(
            #deleteBatch,
            [batchId],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, bool>>);
}
