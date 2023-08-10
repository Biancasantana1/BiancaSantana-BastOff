import 'package:flutter/material.dart';

class CustomDropdownComponent extends StatefulWidget {
  final ValueNotifier<String?> selectedClientType;

  const CustomDropdownComponent({Key? key, required this.selectedClientType})
      : super(key: key);

  @override
  _CustomDropdownComponentState createState() =>
      _CustomDropdownComponentState();
}

class _CustomDropdownComponentState extends State<CustomDropdownComponent> {
  bool isOpened = false;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String?>(
      valueListenable: widget.selectedClientType,
      builder: (context, value, child) {
        return DropdownButtonHideUnderline(
          child: Container(
            height: 55,
            child: DropdownButtonFormField<String>(
              value: value,
              icon: Icon(Icons.arrow_drop_down, color: Colors.transparent),
              onTap: () {
                setState(() {
                  isOpened = !isOpened;
                });
              },
              items: [
                ...[
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
                    child: Container(
                      height: 50,
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            clientType,
                            style: TextStyle(
                              color: const Color(0XFF040908),
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          if (clientType == "Selecione o tipo de cliente")
                            Transform.rotate(
                              angle: isOpened ? -1.57079 : 1.57079,
                              child: Icon(Icons.arrow_forward_ios_rounded,
                                  color: const Color(0xFF040908)),
                            ),
                        ],
                      ),
                      decoration:
                          (clientType != "Selecione o tipo de cliente" &&
                                  clientType != "Titânio")
                              ? BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: const Color(0xFF00BC70),
                                      width: 0.3,
                                    ),
                                  ),
                                )
                              : null,
                    ),
                  );
                }).toList()
              ],
              onChanged: (newValue) {
                widget.selectedClientType.value = newValue!;
                if (newValue != "Selecione o tipo de cliente") {
                  setState(() {
                    isOpened = false;
                  });
                }
              },
              decoration: InputDecoration(
                fillColor: const Color(0xFFF5F5F5),
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: const Color(0xFF00BC70),
                    width: 0.8,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: const Color(0xFF00BC70),
                    width: 0.8,
                  ),
                ),
              ),
              style: TextStyle(
                color: const Color(0XFF040908),
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
}
