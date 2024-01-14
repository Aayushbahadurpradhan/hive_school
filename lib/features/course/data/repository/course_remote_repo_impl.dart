import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management_hive_api/core/failure/failure.dart';
import 'package:student_management_hive_api/features/auth/domain/entity/auth_entity.dart';
import 'package:student_management_hive_api/features/course/data/data_source/course_remote_data_source.dart';
import 'package:student_management_hive_api/features/course/domain/entity/course_entity.dart';
import 'package:student_management_hive_api/features/course/domain/repository/course_repository.dart';

final courseRemoteRepositoryProvider = Provider.autoDispose<ICourseRepository>(
  (ref) => CourseRemoteRepoImpl(
    courseRemoteDatSource: ref.read(courseRemoteDataSourceProvider),
  ),
);

class CourseRemoteRepoImpl implements ICourseRepository {
  final CourseRemoteDataSource courseRemoteDatSource;

  const CourseRemoteRepoImpl({required this.courseRemoteDatSource});

  @override
  Future<Either<Failure, bool>> addCourse(CourseEntity course) {
    return courseRemoteDatSource.addCourse(course);
  }

  @override
  Future<Either<Failure, List<CourseEntity>>> getAllCourses() {
    return courseRemoteDatSource.getAllCourses();
  }

  Future<Either<Failure, List<AuthEntity>>> getAllStudentsByCourses(
      String courseId) {
    // TODO: implement getAllStudentsBycourse
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> deleteCourse(String courseId) {
    return courseRemoteDatSource.deleteCourse(courseId);
  }
}
