import 'package:flutter/material.dart';

class ConversaoController {
  final TextEditingController controller = TextEditingController();
  double? result;
  final Map<String, String> currencySymbols = {
    'Dollar': '\$',
    'Euro': '€',
    'Pound Sterling': '£',
    'Argentine Peso': 'US\$',
    'Canadian Dollar': 'C\$',
    'Australian Dollar': 'A\$',
    'Japanese Yen': '¥',
    'Renminbi': '¥',
    'Bitcoin': '₿',
  };

  void updateResult(double currencyBuyValue) {
    if (controller.text.isNotEmpty) {
      final double value = double.tryParse(controller.text) ?? 0.0;
      result = value * currencyBuyValue;
    } else {
      result = null;
    }
  }

  void dispose() {
    controller.dispose();
  }
}
