import '../../../../core/app_assets.dart';

class CountryModel {
  final String name;
  final String code;
  final String flag;
  final String dialCode;

  const CountryModel({
    required this.name,
    required this.code,
    required this.flag,
    required this.dialCode,
  });
}

const List<CountryModel> allCountries = [
  CountryModel(
    name: 'Kuwait',
    code: 'KW',
    flag: AppAssets.kuwaitFlag,
    dialCode: '+965',
  ),
  CountryModel(
    name: 'Saudi Arabia',
    code: 'SA',
    flag: AppAssets.saudiArabiaFlag,
    dialCode: '+966',
  ),
  CountryModel(
    name: 'United Arab Emirates',
    code: 'AE',
    flag: AppAssets.uaeFlag,
    dialCode: '+971',
  ),
  CountryModel(
    name: 'Qatar',
    code: 'QA',
    flag: AppAssets.qatarFlag,
    dialCode: '+974',
  ),
  CountryModel(
    name: 'Bahrain',
    code: 'BH',
    flag: AppAssets.bahrainFlag,
    dialCode: '+973',
  ),
  CountryModel(
    name: 'Oman',
    code: 'OM',
    flag: AppAssets.omanFlag,
    dialCode: '+968',
  ),
];
