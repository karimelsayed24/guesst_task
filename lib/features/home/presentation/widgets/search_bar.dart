import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/app_assets.dart';
import '../../../search/domain/models/filter.dart';
import '../../../search/presentation/pages/filter_screen.dart';
import '../../../search/presentation/pages/search_results_screen.dart';

class SearchBarWidgets extends StatelessWidget {
  const SearchBarWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: const Color(0xffCCCCCC)),
      ),
      child: Row(
        children: [
          const Icon(Icons.search, color: Colors.grey),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(
                hintText: 'Search for Job or Company',
                border: InputBorder.none,
              ),
              onSubmitted: (query) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchResultsScreen(
                      initialQuery: query,
                    ),
                  ),
                );
              },
            ),
          ),
          IconButton(
            icon: SvgPicture.asset(AppAssets.filterIcon),
            onPressed: () {
              Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FilterScreen(
                        initialFilters: FilterOptions(),
                      ),
                    ),
                  );
            },
          ),
        ],
      ),
    );
  }
}
