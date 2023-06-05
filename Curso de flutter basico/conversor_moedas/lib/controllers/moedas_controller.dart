import 'package:conversor_moedas/model/moedas_model.dart';
import 'package:conversor_moedas/repositories/moedas_repository.dart';
import 'package:flutter/material.dart';

import '../model/usd_model.dart';

class MoedasController {
  final MoedasRepository _moedasRepository;
  ValueNotifier<Moedas?> moedas = ValueNotifier<Moedas?>(null);

  MoedasController(this._moedasRepository) {
    fetch();
  }

  Future<void> fetch() async {
    Moedas moedasData = await _moedasRepository.getMoedas();
    moedas.value = moedasData;
  }
  List<USD>? getCurrencyList() {
    return moedas.value?.results.currencies.currencyMap.values.toList();
  }
}
