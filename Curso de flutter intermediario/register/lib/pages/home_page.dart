import 'package:flutter/material.dart';
import 'package:register/pages/client_list_page.dart';
import 'package:register/pages/register_page.dart';
import '../component/custom_button_component.dart';
import '../utils/assets_images_utils.dart';
import '../widgets/custom_app_bar_widget.dart';
import '../widgets/home_page/custom_section_photo_widget.dart';
import '../widgets/home_page/custom_section_second_photo_widget.dart';
import '../widgets/home_page/custom_section_three_photo_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CustomAppBarWidget(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomSectionPhotoWidget(
              backgroundAsset: AssetsImg.photoFone,
              textSpans: const [
                TextSpan(
                    text:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor '),
                TextSpan(
                  text: 'ncididunt ut labore',
                  style: TextStyle(
                    color: Color(0xFF00BC70),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                TextSpan(text: ' et dolore magna.'),
              ],
              buttonText: 'Cadastrar clientes',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegisterPage(),
                  ),
                );
              },
              height: 40,
              width: 170,
            ),
            CustomSectionSecondPhotoWidget(
              backgroundAsset: AssetsImg.positivoPerson,
              text: 'Gerencie os tipos de clientes agora mesmo!',
              buttonText: 'Ir agora',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegisterPage(),
                  ),
                );
              },
              textTopPosition: 0.06,
              buttonTopPosition: 0.12,
            ),
            CustomSectionThreePhotoWidget(
              backgroundAsset: AssetsImg.emotionsPerson,
              text:
                  'Visualize agora uma lista completa com todos os seus clientes cadastrados!',
              buttonText: 'Ir agora',
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
