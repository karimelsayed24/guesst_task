import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_button.dart';
import '../../data/models/region_model.dart';
import 'job_type_selection_screen.dart';

class RegionSelectionScreen extends StatefulWidget {
  const RegionSelectionScreen({super.key});

  @override
  State<RegionSelectionScreen> createState() => _RegionSelectionScreenState();
}

class _RegionSelectionScreenState extends State<RegionSelectionScreen> {
  final _searchController = TextEditingController();
  final _scrollController = ScrollController();

  RegionModel? _selectedRegion;
  List<RegionModel> _filteredRegions = [];

  @override
  void initState() {
    super.initState();
    _filteredRegions = allRegionModels;
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _handleSearch(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredRegions = allRegionModels;
      } else {
        _filteredRegions = allRegionModels
            .where((region) =>
                region.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  void _handleContinue() {
    if (_selectedRegion != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const JobTypeSelectionScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Logo
              Image.asset(
                'assets/images/logo.png',
                height: 80,
              ),
              const SizedBox(height: 40),

              // Title
              Text(
                'Select your region',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),

              // Search Field
              TextField(
                controller: _searchController,
                onChanged: _handleSearch,
                decoration: InputDecoration(
                  hintText: 'Search regions...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xFF27AAD8)),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Regions List
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: Scrollbar(
                  controller: _scrollController,
                  thumbVisibility: true,
                  trackVisibility: true,
                  thickness: 8,
                  radius: const Radius.circular(4),
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount: _filteredRegions.length,
                    itemBuilder: (context, index) {
                      final region = _filteredRegions[index];
                      return ListTile(
                        title: Text(region.name),
                        leading: Radio<RegionModel>(
                          value: region,
                          groupValue: _selectedRegion,
                          onChanged: (value) {
                            setState(() {
                              _selectedRegion = value;
                            });
                          },
                          activeColor: const Color(0xFF27AAD8),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Continue Button
              CustomButton(
                text: 'Continue',
                onPressed: _handleContinue,
                isLoading: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
