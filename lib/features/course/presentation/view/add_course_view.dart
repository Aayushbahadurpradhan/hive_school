import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/common/snackbar/my_snackbar.dart';
import '../../domain/entity/course_entity.dart';
import '../view_model/course_view_model.dart';

class AddCourseView extends ConsumerStatefulWidget {
  const AddCourseView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddCourseViewState();
}

class _AddCourseViewState extends ConsumerState<AddCourseView> {
  final courseController = TextEditingController();
  var gap = const SizedBox(height: 8);

  @override
  Widget build(BuildContext context) {
    final courseState = ref.watch(courseViewModelProvider);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (courseState.showMessage) {
        showSnackBar(message: 'Course Added', context: context);
        ref.read(courseViewModelProvider.notifier).resetMessage(false);
      }
    });

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            gap,
            const Align(
              alignment: Alignment.center,
              child: Text(
                'Add Course',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            gap,
            TextFormField(
              controller: courseController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Course Name',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter course name';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  CourseEntity course =
                      CourseEntity(courseName: courseController.text);
                  ref.read(courseViewModelProvider.notifier).addCourse(course);
                },
                child: const Text('Add Course'),
              ),
            ),
            const SizedBox(height: 10),
            const Align(
              alignment: Alignment.center,
              child: Text(
                'List of Courses',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            gap,
            courseState.isLoading
                ? const Center(child: CircularProgressIndicator())
                : Expanded(
                    child: ListView.builder(
                      itemCount: courseState.courses.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            courseState.courses[index].courseName,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          subtitle: Text(
                            courseState.courses[index].courseId ?? 'No id',
                            style: const TextStyle(
                              color: Colors.indigo,
                              fontSize: 12,
                            ),
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text(
                                      'Are you sure you want to delete ${courseState.courses[index].courseName} ?'),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text('No')),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                          ref
                                              .read(courseViewModelProvider
                                                  .notifier)
                                              .deleteCourse(courseState
                                                      .courses[index]
                                                      .courseId ??
                                                  'Not deleted');
                                        },
                                        child: const Text('Yes'))
                                  ],
                                ),
                              );
                              // ref
                              //     .read(courseViewModelProvider.notifier)
                              //     .deleteCourse(
                              //         courseState.courses[index].courseId ??
                              //             'Not deleted');
                            },
                          ),
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
