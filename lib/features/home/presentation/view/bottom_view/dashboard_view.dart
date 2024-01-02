// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:student_management_hive_api/core/common/snackbar/my_snackbar.dart';
// import 'package:student_management_hive_api/features/home/presentation/view_model/home_view_model.dart';

// class DashboardView extends ConsumerStatefulWidget {
//   const DashboardView({super.key});

//   @override
//   ConsumerState<DashboardView> createState() => _DashboardViewState();
// }

// class _DashboardViewState extends ConsumerState<DashboardView> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Dashboard View'),
//         actions: [
//           IconButton(
//             onPressed: () {
//               showSnackBar(message: 'Refreshing...', context: context);
//             },
//             icon: const Icon(
//               Icons.refresh,
//               color: Colors.white,
//             ),
//           ),
//           IconButton(
//             onPressed: () {
//               ref.read(homeViewModelProvider.notifier).signOut(context);
//             },
//             icon: const Icon(
//               Icons.logout,
//               color: Colors.white,
//             ),
//           ),
//           Switch(value: true, onChanged: (value) {}),
//         ],
//       ),
//       body: Column(
//         children: [
//           const SizedBox(height: 20),
//           const Text(
//             'Batch',
//             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//           ),
//           SizedBox(
//             height: 280,
//             child: buildGridView(),
//           ),
//           const SizedBox(height: 20),
//           const Text(
//             'Courses',
//             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//           ),
//           SizedBox(
//             height: 280,
//             child: buildGridView(),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget buildGridView() {
//     return GridView.builder(
//       padding: const EdgeInsets.all(8),
//       scrollDirection: Axis.horizontal, // Set scroll direction to horizontal
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         mainAxisSpacing: 5,
//         crossAxisSpacing: 5,
//       ),
//       itemCount: 4, // Set your itemCount as needed
//       itemBuilder: (context, index) {
//         return ClipRRect(
//           borderRadius:
//               BorderRadius.circular(10.0), // Set your desired border radius
//           child: Container(
//             // width: 250,
//             alignment: Alignment.center,
//             color: Colors.green,
//             child: Text('Item $index'),
//           ),
//         );
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management_hive_api/core/common/snackbar/my_snackbar.dart';
import 'package:student_management_hive_api/features/batch/presentation/view_model/batch_view_model.dart';
import 'package:student_management_hive_api/features/course/presentation/view_model/course_view_model.dart';
import 'package:student_management_hive_api/features/home/presentation/view_model/home_view_model.dart';
import 'package:student_management_hive_api/features/home/presentation/widget/batch_widget.dart';
import 'package:student_management_hive_api/features/home/presentation/widget/course_widget.dart';

class DashboardView extends ConsumerStatefulWidget {
  const DashboardView({super.key});

  @override
  ConsumerState<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends ConsumerState<DashboardView> {
  // late bool isDark;
  // @override
  // void initState() {
  //   isDark = ref.read(isDarkThemeProvider);
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    var batchState = ref.watch(batchViewModelProvider);
    var courseState = ref.watch(courseViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard View'),
        actions: [
          IconButton(
            onPressed: () {
              // ref.read(batchViewModelProvider.notifier).getBatches();
              // ref.read(courseViewModelProvider.notifier).getCourses();
              showSnackBar(message: 'Refressing...', context: context);
            },
            icon: const Icon(
              Icons.refresh,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {
              ref.read(homeViewModelProvider.notifier).signOut(context);
            },
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
          ),
          // Switch(
          //     value: isDark,
          //     onChanged: (value) {
          //       setState(() {
          //         isDark = value;
          //         ref.read(isDarkThemeProvider.notifier).updateTheme(value);
          //       });
          //     }),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Batches',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Flexible(
              child: BatchWidget(ref: ref, batchList: batchState.batches),
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Courses',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Flexible(
              child: CourseWidget(courseList: courseState.courses),
            ),
          ],
        ),
      ),
    );
  }
}
