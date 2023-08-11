import 'package:flutter/material.dart';
import 'package:register/pages/client_list_page.dart';
import 'package:register/pages/register_page.dart';
import 'package:register/pages/splash_screen_page.dart';
import '../component/custom_textfield_component.dart';
import '../utils/assets_images_utils.dart';
import '../widgets/custom_app_bar_widget.dart';
import '../widgets/menu_page/custom_menu_item_widget.dart';

class MenuPage extends StatelessWidget {
  MenuPage({
    super.key,
  });
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void searchClients(String query) {
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
                onSearchComplete: searchClients,
              )),
          const SizedBox(height: 20),
          CustomMenuItemWidget(
            title: "Gerenciar clientes",
            trailingIcon: Icons.arrow_forward_ios_rounded,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RegisterPage(),
              ),
            ),
          ),
          const Divider(),
          CustomMenuItemWidget(
            title: "Gerenciar tipos de clientes",
            trailingIcon: Icons.arrow_forward_ios_rounded,
            onTap: () {},
          ),
          const Divider(),
          CustomMenuItemWidget(
            title: "Ver todos os clientes",
            trailingIcon: Icons.arrow_forward_ios_rounded,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ClientListPage(),
                ),
              );
            },
          ),
          const Divider(),
          CustomMenuItemWidget(
            title: "Sair da conta",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SplashScreenPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
