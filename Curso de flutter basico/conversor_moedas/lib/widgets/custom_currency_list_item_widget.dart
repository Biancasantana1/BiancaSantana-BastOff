import 'package:conversor_moedas/model/moeda_model.dart';
import 'package:flutter/material.dart';

class CustomCurrencyListItem extends StatelessWidget {
  final Moeda currency;

  const CustomCurrencyListItem({Key? key, required this.currency})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      margin: const EdgeInsets.fromLTRB(18.0, 8.0, 18.0, 8.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.0),
        border: Border.all(
          color: Colors.white.withOpacity(0.5),
          width: 2,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 15.0, 0.0, 0),
        child: Text(
          currency.name.toString(),
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
