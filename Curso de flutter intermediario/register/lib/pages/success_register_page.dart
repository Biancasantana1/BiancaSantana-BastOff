import 'package:flutter/material.dart';
import 'package:register/pages/client_list_page.dart';
import '../component/custom_button_component.dart';
import '../component/custom_text_title_component.dart';
import '../widgets/custom_app_bar_widget.dart';

class SuccessRegisterPage extends StatelessWidget {
  const SuccessRegisterPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
              text: "Cadastrar cliente",
            ),
            const SizedBox(height: 120.0),
            Container(
              height: 118,
              width: 118,
              decoration: const BoxDecoration(
                color: Color(0xFF00BC70),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.check_rounded,
                color: Colors.white,
                size: 70,
              ),
            ),
            const SizedBox(height: 24.0),
            const Text(
              "Oba! Um novo cliente foi cadastrado.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 3.0),
            const Text(
              "Deseja ver a listagem dos clientes?",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w300,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 32.0),
            CustomButtonComponent(
              text: 'Ir agora',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ClientListPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
