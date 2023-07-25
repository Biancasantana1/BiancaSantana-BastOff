import 'package:flutter/material.dart';

class CustomSelectSearchWidget extends StatefulWidget {
  final Function(String) onSelectedSpecialty;

  const CustomSelectSearchWidget({
    super.key,
    required this.onSelectedSpecialty,
  });

  @override
  CustomSelectSearchWidgetState createState() =>
      CustomSelectSearchWidgetState();
}

class CustomSelectSearchWidgetState extends State<CustomSelectSearchWidget> {
  int _selectedButtonIndex = -1;
  final List<String> buttonTexts = [
    'Vaccine',
    'Surgery',
    'SPA & Treatment',
    'Consultation',
  ];

  void _onButtonPressed(int index) {
    setState(() {
      if (_selectedButtonIndex == index) {
        _selectedButtonIndex = -1;
        widget.onSelectedSpecialty('');
      } else {
        _selectedButtonIndex = index;
        widget.onSelectedSpecialty(buttonTexts[index]);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      margin: EdgeInsets.fromLTRB(
        MediaQuery.of(context).size.width * 0.05,
        MediaQuery.of(context).size.height * 0.01,
        MediaQuery.of(context).size.width * 0.05,
        0,
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return TextButton(
            onPressed: () => _onButtonPressed(index),
            child: Container(
              decoration: BoxDecoration(
                color: _selectedButtonIndex == index
                    ? const Color(0xFF818AF9)
                    : const Color(0XFFF6F6F6),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10,
              ),
              child: Text(
                buttonTexts[index],
                style: TextStyle(
                  color: _selectedButtonIndex == index
                      ? Colors.white
                      : const Color(0xFF3F3E3F).withOpacity(0.3),
                  fontSize: 12,
                  fontFamily: 'Manrope',
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
