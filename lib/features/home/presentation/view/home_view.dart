import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management_hive_api/features/course/presentation/view/add_course_view.dart';
import 'package:student_management_hive_api/features/home/presentation/state/home_state.dart';
import 'package:student_management_hive_api/features/home/presentation/view/bottom_view/dashboard_view.dart';
import 'package:student_management_hive_api/features/home/presentation/view/bottom_view/profile_view.dart';
import 'package:student_management_hive_api/features/home/presentation/view_model/home_view_model.dart';

import '../../../batch/presentation/view/add_batch_view.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  Widget build(BuildContext context) {
    final homeState = ref.watch(homeViewModelProvider);
    return Scaffold(
      body: homeState.lstWidgets[homeState.index],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Course',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.batch_prediction),
            label: 'Batch',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_city_outlined),
            label: 'Location',
          ),
        ],
        currentIndex: homeState.index,
        onTap: (index) {
          ref.watch(homeViewModelProvider.notifier).changeIndex(index);
          // setState(() {
          //   selectedIndex = index;
          // });
        },
      ),
    );
  }
}
