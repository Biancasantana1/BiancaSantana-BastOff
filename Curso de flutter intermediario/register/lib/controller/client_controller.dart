import 'package:flutter/material.dart';
import '../model/client_model.dart';

class ClientController extends ChangeNotifier {
  final List<Client> _clients = [];
  List<Client> filteredClients = [];

  List<Client> get clients => _clients;

  void addClient(Client client) {
    _clients.add(client);
    filterClientsByName('');
  }

  bool isValidEmail(String email) {
    final RegExp regex = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
    return regex.hasMatch(email);
  }

  bool isEmailDuplicate(String email, [Client? currentClient]) {
    return _clients.any((client) =>
        client.email.toLowerCase() == email.toLowerCase() &&
        client != currentClient);
  }

  void removeClient(Client client) {
    _clients.remove(client);
    filterClientsByName('');
  }

  void updateClient(Client oldClient, Client newClient) {
    int index = _clients.indexOf(oldClient);
    if (index != -1) {
      _clients[index] = newClient;
      notifyListeners();
    }
  }

  Color getClientTypeColor(String? type) {
    switch (type?.toLowerCase()) {
      case 'comum':
        return const Color(0xFF969696);
      case 'bronze':
        return const Color(0xFFAB965E);
      case 'prata':
        return const Color(0xFFB9B9B9);
      case 'ouro':
        return const Color(0xFFEBB700);
      case 'diamante':
        return const Color(0xFF01AFA4);
      default:
        return const Color(0xFFC1C3A6);
    }
  }

  void filterClientsByName(String query) {
    if (query.isEmpty) {
      filteredClients = List.from(_clients);
    } else {
      filteredClients = _clients
          .where((client) =>
              client.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }
}
