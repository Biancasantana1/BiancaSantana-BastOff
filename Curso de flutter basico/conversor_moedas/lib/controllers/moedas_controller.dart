import 'package:conversor_moedas/model/moedas_model.dart';
import 'package:conversor_moedas/repositories/moedas_repository.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import '../model/moeda_model.dart';

class MoedasController {
  final MoedasRepository _moedasRepository;
  ValueNotifier<Moedas?> moedas = ValueNotifier<Moedas?>(null);

  MoedasController(this._moedasRepository) {
    fetch();
  }

  Future<void> fetch() async {
    try {
      Moedas moedasData = await _moedasRepository.getMoedas();
      moedas.value = moedasData;
    } catch (e, stackTrace) {
      FirebaseCrashlytics.instance.recordError(e, stackTrace);
    }
  }

  List<Moeda>? getCurrencyList() {
    return moedas.value?.results.currencies.currencyMap.values.toList();
  }

  void dispose() {
    moedas.dispose();
  }
}
