import 'package:flutter/material.dart';

class CustomDropdownWidget extends StatefulWidget {
  final ValueNotifier<String?> selectedClientType;

  const CustomDropdownWidget({
    super.key,
    required this.selectedClientType,
  });

  @override
  CustomDropdownComponentState createState() => CustomDropdownComponentState();
}

class CustomDropdownComponentState extends State<CustomDropdownWidget> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String?>(
      valueListenable: widget.selectedClientType,
      builder: (context, value, child) {
        return DropdownButtonHideUnderline(
          child: SizedBox(
            height: 55,
            child: DropdownButtonFormField<String>(
              value: value,
              icon: Transform.rotate(
                angle: 1.57079,
                child: const Icon(Icons.arrow_forward_ios_rounded,
                    color: Color(0xFF040908)),
              ),
              items: _buildDropdownItems(),
              onChanged: (newValue) {
                widget.selectedClientType.value = newValue!;
              },
              decoration: InputDecoration(
                fillColor: const Color(0xFFF5F5F5),
                filled: true,
                enabledBorder: _buildInputBorder(),
                focusedBorder: _buildInputBorder(),
              ),
              style: const TextStyle(
                color: Color(0XFF040908),
                fontSize: 14,
                fontWeight: FontWeight.w300,
              ),
              dropdownColor: const Color(0xFFF5F5F5),
            ),
          ),
        );
      },
    );
  }

  List<DropdownMenuItem<String>> _buildDropdownItems() {
    return [
      "Selecione o tipo de cliente",
      "Comum",
      "Bronze",
      "Prata",
      "Ouro",
      "Platina",
      "Diamante",
      "Titânio"
    ].map((String clientType) {
      return DropdownMenuItem<String>(
        value: clientType,
        child: _buildDropdownItemChild(clientType),
      );
    }).toList();
  }

  Widget _buildDropdownItemChild(String clientType) {
    return Container(
      height: 50,
      alignment: Alignment.centerLeft,
      decoration: (clientType != "Selecione o tipo de cliente" &&
              clientType != "Titânio")
          ? const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Color(0xFF00BC70),
                  width: 0.3,
                ),
              ),
            )
          : null,
      child: Text(clientType),
    );
  }

  OutlineInputBorder _buildInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: Color(0xFF00BC70),
        width: 0.8,
      ),
    );
  }
}
