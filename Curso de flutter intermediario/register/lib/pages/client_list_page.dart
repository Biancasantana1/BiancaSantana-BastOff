import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:register/pages/register_page.dart';
import '../component/custom_button_component.dart';
import '../component/custom_text_title_component.dart';
import '../component/custom_textfield_component.dart';
import '../controller/client_controller.dart';
import '../utils/assets_images_utils.dart';
import '../widgets/custom_app_bar_widget.dart';

class ClientListPage extends StatefulWidget {
  final String? searchQuery;

  const ClientListPage({Key? key, this.searchQuery}) : super(key: key);

  @override
  ClientListPageState createState() => ClientListPageState();
}

class ClientListPageState extends State<ClientListPage> {
  int itemCount = 6;
  late final TextEditingController searchController;

  @override
  @override
  void initState() {
    super.initState();
    searchController = TextEditingController(text: widget.searchQuery);
    Provider.of<ClientController>(context, listen: false)
        .filterClientsByName(searchController.text);
    searchController.addListener(() {
      Provider.of<ClientController>(context, listen: false)
          .filterClientsByName(searchController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    final clients = Provider.of<ClientController>(context).clients;
    final clientController = Provider.of<ClientController>(context);
    final filteredClients = clientController.filteredClients;

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CustomAppBarWidget(),
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CustomTextTitleComponent(
              text: "Todos os clientes",
            ),
            const SizedBox(height: 32.0),
            CustomTextFieldComponent(
              controller: searchController,
              foto: AssetsImg.search,
              texto: 'Buscar por cliente',
              isTextLight: false,
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Arraste para o lado para remover',
              style: TextStyle(
                color: Color(0XFF969696),
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 15.0),
            Expanded(
              child: ListView.builder(
                itemCount: itemCount <= filteredClients.length
                    ? itemCount
                    : filteredClients.length,
                itemBuilder: (context, index) {
                  final client = filteredClients[index];
                  return Column(
                    children: [
                      GestureDetector(
                        onDoubleTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  RegisterPage(client: client),
                            ),
                          );
                        },
                        child: Dismissible(
                          key: ValueKey(client.email),
                          direction: DismissDirection.horizontal,
                          onDismissed: (direction) {
                            final removedClient = client;
                            Provider.of<ClientController>(context,
                                    listen: false)
                                .removeClient(client);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: const Text('Cliente removido'),
                                action: SnackBarAction(
                                  label: 'Desfazer',
                                  onPressed: () {
                                    Provider.of<ClientController>(context,
                                            listen: false)
                                        .addClient(removedClient);
                                  },
                                ),
                              ),
                            );
                          },
                          background: Container(color: Colors.red),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 71,
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF5F5F5),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      client.name,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                      ),
                                    ),
                                    const Spacer(),
                                    Text(
                                      client.type,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: clientController
                                            .getClientTypeColor(client.type),
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  client.email,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: Color(0XFF040908),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      if (index < itemCount - 1) const SizedBox(height: 15),
                    ],
                  );
                },
              ),
            ),
            if (itemCount < clients.length)
              CustomButtonComponent(
                text: "Carregar mais",
                height: 40,
                width: 130,
                onPressed: () {
                  setState(() {
                    itemCount += 6;
                  });
                },
              ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
