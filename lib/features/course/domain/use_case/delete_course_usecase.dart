import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/failure/failure.dart';
import '../repository/course_repository.dart';

final deleteCourseUsecaseProvider = Provider.autoDispose<DeleteCourseUsecase>(
      (ref) => DeleteCourseUsecase(repository: ref.read(courseRepositoryProvider)),
);

class DeleteCourseUsecase {
  final ICourseRepository repository;

  DeleteCourseUsecase({
    required this.repository,
  });

  Future<Either<Failure, bool>> deleteCourse(String courseId) async {
    return await repository.deleteCourse(courseId);
  }
}
