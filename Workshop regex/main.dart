void main() {
  validateCEP("37540-000");
  validateCEP("37540000");
  validateCEP("37540-0000");
  print(validarRegra(r"^(\d{2}).(\d{3}).(\d{3})/(\d{4})-(\d{2})$|(^\d{14}$)",
      "21.121.234/3322-21"));
  cnpjAllMatches();
  cnpjFirstMatch("43.699.281/0001-25");
  cnpjMatchAsPrefix("43.699.281/0001-25");
}

bool validarRegra(String regra, String palavra) {
  RegExp regex = RegExp(regra);
  return regex.hasMatch(palavra);
}

void validateCEP(String cep) {
  String regra = r"^(\d{5})-([0-9]{3})$|^(\d{8})$";
  RegExp regex = RegExp(regra);
  print("Validando CEP: ${regex.hasMatch(cep)}");
}

void cnpjAllMatches() {
  String cnpj = "21.121.234/3322-21";
  String regra = r"[4-6]";
  RegExp regex = RegExp(regra);

  Iterable<Match> matches = regex.allMatches(cnpj);

  for (Match match in matches) {
    print("Ocorrência do número ${match[0]} na posição ${match.start}");
  }
}

void cnpjFirstMatch(String cnpj) {
  RegExp regex = RegExp(r"[6-9]{3}");
  RegExpMatch? match = regex.firstMatch(cnpj);
  if (match != null) {
    print("CNPJ firstMatch: ${match[0]}");
  } else {
    print("CNPJ firstMatch: ${match}");
  }
}

void cnpjMatchAsPrefix(String cnpj) {
  RegExp regex = RegExp(r"[6-9]{3}");

  var match = regex.matchAsPrefix(cnpj, 3);

  if (match != null) {
    print("CNPJ MatchAsPrefix: ${match[0]}");
  } else {
    print("CNPJ MatchAsPrefix: ${match}");
  }
}
