import 'package:flutter/material.dart';
import 'package:register/pages/client_list_page.dart';
import 'package:register/pages/register_page.dart';
import 'package:register/pages/splash_screen_page.dart';
import '../component/custom_textfield_component.dart';
import '../utils/assets_images_utils.dart';
import '../widgets/custom_app_bar_widget.dart';

class MenuPage extends StatelessWidget {
  MenuPage({super.key});
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void _searchClients(String query) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ClientListPage(searchQuery: query),
        ),
      );
    }

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CustomAppBarWidget(
          showCloseIcon: true,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.03,
                left: 32,
                right: 32,
              ),
              child: CustomTextFieldComponent(
                controller: searchController,
                foto: AssetsImg.search,
                texto: 'Buscar por cliente',
                isTextLight: false,
                onSearchComplete: _searchClients,
              )),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(
              left: 32,
              right: 32,
            ),
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text(
                "Gerenciar clientes",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0XFF040908),
                ),
              ),
              trailing: const Icon(Icons.arrow_forward_ios_rounded,
                  color: Colors.black),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegisterPage(),
                  ),
                );
              },
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.only(
              left: 32,
              right: 32,
            ),
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text(
                "Gerenciar tipos de clientes",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0XFF040908),
                ),
              ),
              trailing: const Icon(Icons.arrow_forward_ios_rounded,
                  color: Colors.black),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegisterPage(),
                  ),
                );
              },
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.only(
              left: 32,
              right: 32,
            ),
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text(
                "Ver todos os clientes",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0XFF040908),
                ),
              ),
              trailing: const Icon(Icons.arrow_forward_ios_rounded,
                  color: Colors.black),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ClientListPage(),
                  ),
                );
              },
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.only(
              left: 32,
              right: 32,
            ),
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text(
                "Sair da conta",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0XFF040908),
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SplashScreenPage(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
