import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management_hive_api/core/common/snackbar/my_snackbar.dart';
import 'package:student_management_hive_api/features/auth/presentation/view_model/auth_viewmodel.dart';
import 'package:student_management_hive_api/features/batch/presentation/view_model/batch_view_model.dart';
import 'package:student_management_hive_api/features/course/presentation/view_model/course_view_model.dart';
import 'package:student_management_hive_api/features/home/presentation/view_model/home_view_model.dart';

class ProfileView extends ConsumerStatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  ConsumerState<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends ConsumerState<ProfileView> {
  @override
  Widget build(BuildContext context) {
    var batchState = ref.watch(batchViewModelProvider);
    var courseState = ref.watch(courseViewModelProvider);
    var authState = ref.watch(authViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile View'),
        actions: [
          IconButton(
            onPressed: () {
              // Implement your logic for refreshing or any other action
              showSnackBar(message: 'Refreshing...', context: context);
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
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'User Profile',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              title: Text('Name: John Doe'),
            ),
            ListTile(
              title: Text('Email: john.doe@example.com'),
            ),
          ],
        ),
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:student_management_hive_api/core/common/snackbar/my_snackbar.dart';
// import 'package:student_management_hive_api/features/auth/presentation/view_model/auth_viewmodel.dart';
// import 'package:student_management_hive_api/features/batch/presentation/view_model/batch_view_model.dart';
// import 'package:student_management_hive_api/features/course/presentation/view_model/course_view_model.dart';
// import 'package:student_management_hive_api/features/home/presentation/view_model/home_view_model.dart';

// class ProfileView extends ConsumerStatefulWidget {
//   const ProfileView({Key? key}) : super(key: key);

//   @override
//   ConsumerState<ProfileView> createState() => _ProfileViewState();
// }

// class _ProfileViewState extends ConsumerState<ProfileView> {
//   @override
//   Widget build(BuildContext context) {
//     var batchState = ref.watch(batchViewModelProvider);
//     var courseState = ref.watch(courseViewModelProvider);
//     var authState = ref.watch(authViewModelProvider);

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Profile View'),
//         actions: [
//           IconButton(
//             onPressed: () {
//               // Implement your logic for refreshing or any other action
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
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             Align(
//               alignment: Alignment.centerLeft,
//               child: Text(
//                 'User Profile',
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             // Display User Image
//             InkWell(
//               onTap: () {
//                 // Add logic to view the image here
//               },
//               child: SizedBox(
//                 height: 200,
//                 width: 200,
//                 child: CircleAvatar(
//                   radius: 50,
//                   backgroundImage: authState.image != null
//                       ? FileImage(authState.image!)
//                       : const AssetImage('assets/images/profile.png')
//                           as ImageProvider,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 25),
//             // Display User Information
//             ListTile(
//               title: Text('First Name: ${authState.fname}'),
//             ),
//             ListTile(
//               title: Text('Last Name: ${authState.lname}'),
//             ),
//             ListTile(
//               title: Text('Phone: ${authState.phone}'),
//             ),
//             ListTile(
//               title: Text('Username: ${authState.username}'),
//             ),
//             // Add more user information widgets as needed
//           ],
//         ),
//       ),
//     );
//   }
// }
