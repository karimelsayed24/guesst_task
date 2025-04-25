class RegionModel {
  final String id;
  final String name;
  final String code;

  RegionModel({
    required this.id,
    required this.name,
    required this.code,
  });

  factory RegionModel.fromJson(Map<String, dynamic> json) {
    return RegionModel(
      id: json['id'] as String,
      name: json['name'] as String,
      code: json['code'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'code': code,
    };
  }
}
final List<RegionModel> allRegionModels = [
    RegionModel(id: '1', name: 'Palestine', code: 'PS'),
    RegionModel(id: '2', name: 'Egypt', code: 'EG'),
    RegionModel(id: '3', name: 'Yemen', code: 'YE'),
    RegionModel(id: '4', name: 'Syria', code: 'SY'),
    RegionModel(id: '5', name: 'Jordan', code: 'JO'),
    RegionModel(id: '6', name: 'Lebanon', code: 'LB'),
    RegionModel(id: '7', name: 'Iraq', code: 'IQ'),
    RegionModel(id: '8', name: 'Saudi Arabia', code: 'SA'),
    RegionModel(id: '9', name: 'United Arab Emirates', code: 'AE'),
    RegionModel(id: '10', name: 'Qatar', code: 'QA'),
    RegionModel(id: '11', name: 'Kuwait', code: 'KW'),
    RegionModel(id: '12', name: 'Oman', code: 'OM'),
    RegionModel(id: '13', name: 'Bahrain', code: 'BH'),
  ];