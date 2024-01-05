import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management_hive_api/core/common/provider/is_network_provider.dart';
import 'package:student_management_hive_api/core/failure/failure.dart';
import 'package:student_management_hive_api/features/course/data/repository/course_local_repo_impl.dart';
import 'package:student_management_hive_api/features/course/data/repository/course_remote_repo_impl.dart';
import 'package:student_management_hive_api/features/course/domain/entity/course_entity.dart';

final courseRepositoryProvider = Provider.autoDispose<ICourseRepository>(
  (ref) {
    // // Check for the internet
    final internetStatus = ref.watch(connectivityStatusProvider);

    if (ConnectivityStatus.isConnected == internetStatus) {
      // If internet is available then return remote repo
      return ref.watch(courseRemoteRepositoryProvider);
    } else {
      // If internet is not available then return local repo
      return ref.watch(courseLocalRepositoryProvider);
    }
  },
);

abstract class ICourseRepository {
  Future<Either<Failure, bool>> addCourse(CourseEntity course);
  Future<Either<Failure, List<CourseEntity>>> getAllCourses();
  Future<Either<Failure, bool>> deleteCourse(String courseId);
}
