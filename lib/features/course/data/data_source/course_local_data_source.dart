// import 'package:dartz/dartz.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:student_management_hive_api/core/failure/failure.dart';
// import 'package:student_management_hive_api/core/network/hive_service.dart';
// import 'package:student_management_hive_api/features/course/data/model/course_hive_model.dart';
// import 'package:student_management_hive_api/features/course/domain/entity/course_entity.dart';

// final courseLocalDataSourceProvider =
//     Provider.autoDispose<CourseLocalDataSource>((ref) => CourseLocalDataSource(
//           hiveService: ref.read(hiveServiceProvider),
//         ));

// class CourseLocalDataSource {
//   final HiveService hiveService;

//   CourseLocalDataSource({
//     required this.hiveService,
//   });

//   // Add Course
//   Future<Either<Failure, bool>> addCourse(CourseEntity course) async {
//     try {
//       CourseHiveModel courseHiveModel = CourseHiveModel.toHiveModel(course);
//       hiveService.addCourse(courseHiveModel);
//       return const Right(true);
//     } catch (e) {
//       return Left(Failure(error: e.toString()));
//     }
//   }

//   // Get All Courses
//   Future<Either<Failure, List<CourseEntity>>> getAllCourses() async {
//     try {
//       List<CourseHiveModel> courses = await hiveService.getAllCourses();
//       List<CourseEntity> courseEntities =
//           courses.map((e) => CourseHiveModel.toEntity(e)).toList();
//       return Right(courseEntities);
//     } catch (e) {
//       return Left(Failure(error: e.toString()));
//     }
//   }

//   //delete course
//   Future<Either<Failure, bool>> deleteCourse(String courseId) async {
//     try {
//       // Assuming hiveService.deleteCourse returns a Future<void>
//       await hiveService.deleteCourse(courseId);
//       return const Right(true); // Indicate success
//     } catch (e) {
//       return Left(Failure(error: e.toString())); // Indicate failure with an error message
//     }
//   }

// }




import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management_hive_api/core/failure/failure.dart';
import 'package:student_management_hive_api/core/network/hive_service.dart';
import 'package:student_management_hive_api/features/course/data/model/course_hive_model.dart';
import 'package:student_management_hive_api/features/course/domain/entity/course_entity.dart';

final courseLocalDataSourceProvider = Provider<CourseLocalDataSource>(
  (ref) => CourseLocalDataSource(
    hiveService: ref.read(hiveServiceProvider),
    courseHiveModel: ref.read(courseHiveModelProvider),
  ),
);

class CourseLocalDataSource {
  final HiveService hiveService;
  final CourseHiveModel courseHiveModel;

  CourseLocalDataSource({
    required this.hiveService,
    required this.courseHiveModel,
  });
  // Add Course
  Future<Either<Failure, bool>> addCourse(CourseEntity course) async {
    try {
      // Convert Entity to Hive Object
      final hiveCourse = courseHiveModel.toHiveModel(course);
      // Add to Hive
      await hiveService.addCourse(hiveCourse);
      return const Right(true);
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }

  // Get All Courses
  Future<Either<Failure, List<CourseEntity>>> getAllCourses() async {
    try {
      // Get from Hive
      final hiveCourses = await hiveService.getAllCourses();
      // Convert Hive Object to Entity
      final courses = courseHiveModel.toEntityList(hiveCourses);
      return Right(courses);
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }
    //delete course
  Future<Either<Failure, bool>> deleteCourse(String courseId) async {
    try {
      // Assuming hiveService.deleteCourse returns a Future<void>
      await hiveService.deleteCourse(courseId);
      return const Right(true); // Indicate success
    } catch (e) {
      return Left(Failure(error: e.toString())); // Indicate failure with an error message
    }
  }

}
