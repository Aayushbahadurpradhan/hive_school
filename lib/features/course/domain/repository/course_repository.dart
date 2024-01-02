import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management_hive_api/core/failure/failure.dart';
import 'package:student_management_hive_api/features/course/domain/entity/course_entity.dart';
import '../../data/repository/course_local_repo_impl.dart';


final courseRepositoryProvider = Provider.autoDispose<ICourseRepository>((ref) {
  return ref.read(courseLocalRepositoryProvider);
});

abstract class ICourseRepository {
  Future<Either<Failure, bool>> addCourse(CourseEntity course);
  Future<Either<Failure, List<CourseEntity>>> getAllCourses();
  Future<Either<Failure, bool>> deleteCourse(String courseId);
}
