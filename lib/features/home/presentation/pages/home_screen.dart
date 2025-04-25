import 'package:flutter/material.dart';

import '../../domain/models/job.dart';
import '../pages/jobs_listing_page.dart';
import '../widgets/banner_widgets.dart';
import '../widgets/job_card.dart';
import '../widgets/profile_data_list_tile.dart';
import '../widgets/search_bar.dart';
import '../widgets/title_and_see_all_row.dart';
import 'recommendation_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedFilter = 'Marketing';

  @override
  void initState() {
    super.initState();
    _selectedFilter = 'Marketing';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            const ProfileDataListTile(),
            const SizedBox(height: 24),
            const SearchBarWidgets(),
            const SizedBox(height: 24),
            const BannerWidget(),
            const SizedBox(height: 24),
            TitleAndSeeAll(
                title: 'Recommendation',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RecommendationPage()));
                }),
            const SizedBox(height: 16),
            JobCard(job: jobs[1], onSave: () {}),
            const SizedBox(height: 24),
            TitleAndSeeAll(
                title: 'Recent Jobs',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const JobsListingPage()));
                }),
            const SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: ['All', 'Design', 'Marketing', 'Finance']
                    .map(
                      (filter) => Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: FilterChip(
                          label: Text(
                            filter,
                            style: TextStyle(
                              color: _selectedFilter == filter
                                  ? Colors.white
                                  : const Color(0xff246BFE),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          selected: _selectedFilter == filter,
                          onSelected: (selected) {
                            setState(() {
                              _selectedFilter = filter;
                            });
                          },
                          backgroundColor: Colors.white,
                          selectedColor: const Color(0xff246BFE),
                          checkmarkColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: const BorderSide(
                              color: Color(0xff246BFE),
                              width: 1,
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
