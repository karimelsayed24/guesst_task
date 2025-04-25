class ExperienceModel {
  final String id;
  final String name;

  ExperienceModel({
    required this.id,
    required this.name,
  });

  factory ExperienceModel.fromJson(Map<String, dynamic> json) {
    return ExperienceModel(
      id: json['id'] as String,
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
final List<ExperienceModel> allExperienceModels = [
    ExperienceModel(id: '1', name: 'Developer'),
    ExperienceModel(id: '2', name: 'Front end'),
    ExperienceModel(id: '3', name: 'Back end'),
    ExperienceModel(id: '4', name: 'Full stack'), 
    ExperienceModel(id: '5', name: 'Mobile'),
    ExperienceModel(id: '6', name: 'QA'),
    ExperienceModel(id: '7', name: 'DevOps'),
    ExperienceModel(id: '8', name: 'Security'),
    ExperienceModel(id: '9', name: 'Data'),
    ExperienceModel(id: '10', name: 'Designer'),
    ExperienceModel(id: '11', name: 'Project Manager'),
    ExperienceModel(id: '12', name: 'Product Manager'),
    ExperienceModel(id: '13', name: 'Business Analyst'),
  ];