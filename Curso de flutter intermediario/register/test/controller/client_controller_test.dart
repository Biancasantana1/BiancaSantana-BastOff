import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:register/controller/client_controller.dart';
import 'package:register/model/client_model.dart';

void main() {
  group('ClientController', () {
    late ClientController clientController;

    setUp(() {
      clientController = ClientController();
    });

    test('Adicionar cliente', () {
      final client =
          Client(name: 'John Doe', email: 'johndoe@example.com', type: 'Comum');
      clientController.addClient(client);
      expect(clientController.clients.length, 1);
      expect(clientController.clients[0], client);
    });

    test('Validar e-mail', () {
      expect(clientController.isValidEmail('test@example.com'), true);
      expect(clientController.isValidEmail('invalid-email'), false);
    });

    test('Verificar duplicação de e-mail', () {
      final client =
          Client(name: 'John Doe', email: 'johndoe@example.com', type: 'Comum');
      clientController.addClient(client);
      expect(clientController.isEmailDuplicate('johndoe@example.com'), true);
      expect(clientController.isEmailDuplicate('janedoe@example.com'), false);
    });

    test('Remover cliente', () {
      final client =
          Client(name: 'John Doe', email: 'johndoe@example.com', type: 'Comum');
      clientController.addClient(client);
      clientController.removeClient(client);
      expect(clientController.clients.isEmpty, true);
    });

    test('Atualizar cliente', () {
      final oldClient =
          Client(name: 'John Doe', email: 'johndoe@example.com', type: 'Comum');
      final newClient =
          Client(name: 'Jane Doe', email: 'janedoe@example.com', type: 'Prata');
      clientController.addClient(oldClient);
      clientController.updateClient(oldClient, newClient);
      expect(clientController.clients[0], newClient);
    });

    test('Obter cor do tipo de cliente', () {
      expect(clientController.getClientTypeColor('Comum'),
          const Color(0xFF969696));
      expect(
          clientController.getClientTypeColor('Ouro'), const Color(0xFFEBB700));
      // Adicione mais casos de teste para outros tipos, conforme necessário
    });

    test('Filtrar clientes por nome', () {
      final client1 =
          Client(name: 'John Doe', email: 'johndoe@example.com', type: 'Comum');
      final client2 =
          Client(name: 'Jane Doe', email: 'janedoe@example.com', type: 'Prata');
      clientController.addClient(client1);
      clientController.addClient(client2);
      clientController.filterClientsByName('john');
      expect(clientController.filteredClients.length, 1);
      expect(clientController.filteredClients[0], client1);
    });
  });
}
