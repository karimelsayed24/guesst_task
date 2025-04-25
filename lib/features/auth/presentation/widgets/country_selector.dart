import 'package:flutter/material.dart';

import '../../data/models/country_model.dart';

class CountrySelector extends StatelessWidget {
  final CountryModel? selectedCountry;
  final Function(CountryModel) onCountrySelected;

  const CountrySelector({
    super.key,
    required this.selectedCountry,
    required this.onCountrySelected,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<CountryModel>(
      offset: const Offset(0, 40),
      itemBuilder: (context) => allCountries
          .map(
            (country) => PopupMenuItem<CountryModel>(
              value: country,
              child: Row(
                children: [
                  Image.asset(
                    country.flag,
                    width: 24,
                    height: 24,
                  ),
                  const SizedBox(width: 8),
                  Text(country.dialCode),
                  const SizedBox(width: 8),
                  Text(country.name),
                ],
              ),
            ),
          )
          .toList(),
      onSelected: onCountrySelected,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 14),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              selectedCountry?.flag ?? allCountries.first.flag,
              width: 24,
              height: 24,
            ),
            const SizedBox(width: 8),
            Text(
              selectedCountry?.dialCode ?? allCountries.first.dialCode,
              style: const TextStyle(fontSize: 16),
            ),
            const Icon(Icons.arrow_drop_down, size: 20),
          ],
        ),
      ),
    );
  }
}
