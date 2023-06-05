import '../model/moedas_model.dart';

abstract class MoedasRepository {
  Future<Moedas> getMoedas();
}
