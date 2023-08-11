import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:register/pages/client_list_page.dart';
import '../component/custom_button_component.dart';
import '../widgets/custom_dropdown_widget.dart';
import '../component/custom_text_component.dart';
import '../component/custom_text_title_component.dart';
import '../component/custom_textfield_component.dart';
import '../controller/client_controller.dart';
import '../model/client_model.dart';
import '../utils/assets_images_utils.dart';
import '../widgets/custom_app_bar_widget.dart';
import '../pages/success_register_page.dart';

class RegisterPage extends StatelessWidget {
  final Client? client;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final ValueNotifier<String?> selectedClientType;
  final ValueNotifier<bool> showError;
  final ValueNotifier<String?> emailError;

  RegisterPage({
    super.key,
    this.client,
  })  : nameController = TextEditingController(text: client?.name ?? ''),
        emailController = TextEditingController(text: client?.email ?? ''),
        passwordController = TextEditingController(),
        selectedClientType = ValueNotifier<String?>(
            client?.type ?? "Selecione o tipo de cliente"),
        showError = ValueNotifier<bool>(false),
        emailError = ValueNotifier<String?>(null);

  @override
  Widget build(BuildContext context) {
    final clientController =
        Provider.of<ClientController>(context, listen: false);

    return ValueListenableBuilder<String?>(
      valueListenable: emailError,
      builder: (context, emailErrorValue, _) {
        return Scaffold(
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: CustomAppBarWidget(),
          ),
          body: Container(
            color: Colors.white,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextTitleComponent(
                    text:
                        client != null ? "Editar cliente" : "Cadastrar cliente",
                  ),
                  const SizedBox(height: 32.0),
                  Text(
                    client != null
                        ? "Preencha as informações do Formulário para editar um cliente."
                        : "Preencha as informações do formulário para cadastrar um novo cliente.",
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 32.0),
                  const CustomTextComponent(text: "Nome completo"),
                  const SizedBox(height: 8.0),
                  CustomTextFieldComponent(
                    foto: AssetsImg.people,
                    texto: 'ex. Maria Silva',
                    isTextLight: true,
                    controller: nameController,
                  ),
                  const SizedBox(height: 16.0),
                  const CustomTextComponent(text: "E-mail"),
                  const SizedBox(height: 8.0),
                  CustomTextFieldComponent(
                    foto: AssetsImg.people,
                    texto: 'ex. mariasilva@email.com',
                    isTextLight: true,
                    controller: emailController,
                  ),
                  const SizedBox(height: 16.0),
                  const CustomTextComponent(text: "Senha"),
                  const SizedBox(height: 8.0),
                  CustomTextFieldComponent(
                    foto: AssetsImg.people,
                    texto: 'Crie uma senha',
                    isTextLight: true,
                    controller: passwordController,
                    password: true,
                  ),
                  const SizedBox(height: 16.0),
                  const CustomTextComponent(text: "Tipo de cliente"),
                  const SizedBox(height: 8.0),
                  CustomDropdownWidget(
                    selectedClientType: selectedClientType,
                  ),
                  const SizedBox(height: 32.0),
                  if (showError.value)
                    Text(
                      emailError.value ?? 'Preencha todos os dados',
                      style: const TextStyle(color: Colors.red),
                    ),
                  const SizedBox(height: 16.0),
                  Center(
                    child: CustomButtonComponent(
                      onPressed: () {
                        if (nameController.text.isEmpty ||
                            emailController.text.isEmpty ||
                            selectedClientType.value ==
                                "Selecione o tipo de cliente") {
                          showError.value = true;
                          emailError.value =
                              "Por favor, preencha todos os campos";
                          return;
                        }

                        if (!clientController
                            .isValidEmail(emailController.text)) {
                          showError.value = true;
                          emailError.value =
                              "Por favor, digite um e-mail válido";
                          return;
                        }

                        if (clientController.isEmailDuplicate(
                            emailController.text, client)) {
                          showError.value = true;
                          emailError.value = "O e-mail já está cadastrado";
                          return;
                        }

                        showError.value = false;
                        emailError.value = null;
                        final newClient = Client(
                          name: nameController.text,
                          email: emailController.text,
                          type: selectedClientType.value ??
                              "Tipo de cliente não definido",
                        );

                        if (client != null) {
                          Provider.of<ClientController>(context, listen: false)
                              .updateClient(client!, newClient);

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ClientListPage(),
                            ),
                          );
                        } else {
                          Provider.of<ClientController>(context, listen: false)
                              .addClient(newClient);

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SuccessRegisterPage(),
                            ),
                          );
                        }
                      },
                      text: client != null ? "Editar" : "Cadastrar",
                      width: MediaQuery.of(context).size.width,
                      height: 45,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
