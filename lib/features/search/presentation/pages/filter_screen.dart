import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../domain/models/filter.dart';
import '../widgets/job_level_tab.dart';
import '../widgets/location_salary_tab.dart';
import '../widgets/work_type_tab.dart';

class FilterScreen extends StatefulWidget {
  final FilterOptions initialFilters;

  const FilterScreen({
    super.key,
    required this.initialFilters,
  });

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late FilterOptions _filters;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _filters = widget.initialFilters;
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Color(0xFF333333)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Filter',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF333333),
          ),
        ),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: AppColors.primary,
          indicatorWeight: 2,
          labelColor: AppColors.primary,
          unselectedLabelColor: const Color(0xFF8D8D8D),
          tabs: const [
            Tab(text: 'Work Type'),
            Tab(text: 'Job Level'),
            Tab(text: 'Location & Salary'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: WorkTypeTab(
              workType: _filters.workType,
              onWorkTypeChanged: (value) {
                setState(() {
                  _filters = _filters.copyWith(workType: value);
                });
              },
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: JobLevelTab(
              jobLevel: _filters.jobLevel,
              onJobLevelChanged: (value) {
                setState(() {
                  _filters = _filters.copyWith(jobLevel: value);
                });
              },
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: LocationSalaryTab(
              minSalary: _filters.minSalary,
              maxSalary: _filters.maxSalary,
              onSalaryChanged: (min, max) {
                setState(() {
                  _filters = _filters.copyWith(
                    minSalary: min,
                    maxSalary: max,
                  );
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
