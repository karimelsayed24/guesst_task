// import '../models/region_model.dart';

// class RegionDataSource {
//   final List<RegionModel> _regions = [
//     RegionModel(id: '1', name: 'Palestine', code: 'PS'),
//     RegionModel(id: '2', name: 'Egypt', code: 'EG'),
//     RegionModel(id: '3', name: 'Yemen', code: 'YE'),
//     RegionModel(id: '4', name: 'Syria', code: 'SY'),
//     RegionModel(id: '5', name: 'Jordan', code: 'JO'),
//     RegionModel(id: '6', name: 'Lebanon', code: 'LB'),
//     RegionModel(id: '7', name: 'Iraq', code: 'IQ'),
//     RegionModel(id: '8', name: 'Saudi Arabia', code: 'SA'),
//     RegionModel(id: '9', name: 'United Arab Emirates', code: 'AE'),
//     RegionModel(id: '10', name: 'Qatar', code: 'QA'),
//     RegionModel(id: '11', name: 'Kuwait', code: 'KW'),
//     RegionModel(id: '12', name: 'Oman', code: 'OM'),
//     RegionModel(id: '13', name: 'Bahrain', code: 'BH'),
//   ];

//   Future<List<RegionModel>> getRegions() async {
//     return _regions;
//   }

//   Future<List<RegionModel>> searchRegions(String query) async {
//     if (query.isEmpty) return _regions;
//     return _regions
//         .where(
//             (region) => region.name.toLowerCase().contains(query.toLowerCase()))
//         .toList();
//   }
// }
