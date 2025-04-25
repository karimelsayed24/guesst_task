import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_button.dart';
import '../../data/models/experience_model.dart';
import 'profile_completion_screen.dart';

class ExperienceSelectionScreen extends StatefulWidget {
  const ExperienceSelectionScreen({super.key});

  @override
  State<ExperienceSelectionScreen> createState() =>
      _ExperienceSelectionScreenState();
}

class _ExperienceSelectionScreenState extends State<ExperienceSelectionScreen> {
  final _searchController = TextEditingController();

  ExperienceModel? _selectedExperience;
  List<ExperienceModel> _filteredExperiences = [];

  @override
  void initState() {
    super.initState();
    _filteredExperiences = allExperienceModels;
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _handleSearch(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredExperiences = allExperienceModels;
      } else {
        _filteredExperiences = allExperienceModels
            .where((experience) =>
                experience.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  void _handleContinue() {
    if (_selectedExperience != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ProfileCompletionScreen(),
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
                'Select your Experience',
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
                  hintText: 'Search Experiences...',
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

              // Experiences List
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: Scrollbar(
                  thumbVisibility: true,
                  trackVisibility: true,
                  thickness: 8,
                  radius: const Radius.circular(4),
                  child: ListView.builder(
                    itemCount: _filteredExperiences.length,
                    itemBuilder: (context, index) {
                      final experience = _filteredExperiences[index];
                      return ListTile(
                        title: Text(experience.name),
                        leading: Checkbox(
                          value: _selectedExperience?.id == experience.id,
                          onChanged: (value) {
                            setState(() {
                              _selectedExperience =
                                  value == true ? experience : null;
                            });
                          },
                          activeColor: const Color(0xFF27AAD8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
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
