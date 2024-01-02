import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management_hive_api/core/common/snackbar/my_snackbar.dart';
import 'package:student_management_hive_api/features/home/presentation/view_model/home_view_model.dart';

class DashboardView extends ConsumerStatefulWidget {
  const DashboardView({super.key});

  @override
  ConsumerState<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends ConsumerState<DashboardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard View'),
        actions: [
          IconButton(
            onPressed: () {
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
          Switch(value: true, onChanged: (value) {}),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          const Text(
            'Batch',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 280,
            child: buildGridView(),
          ),
          const SizedBox(height: 20),
          const Text(
            'Courses',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 280,
            child: buildGridView(),
          ),
        ],
      ),
    );
  }

  Widget buildGridView() {
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      scrollDirection: Axis.horizontal, // Set scroll direction to horizontal
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
      ),
      itemCount: 4, // Set your itemCount as needed
      itemBuilder: (context, index) {
        return ClipRRect(
          borderRadius:
              BorderRadius.circular(10.0), // Set your desired border radius
          child: Container(
            // width: 250,
            alignment: Alignment.center,
            color: Colors.green,
            child: Text('Item $index'),
          ),
        );
      },
    );
  }
}
