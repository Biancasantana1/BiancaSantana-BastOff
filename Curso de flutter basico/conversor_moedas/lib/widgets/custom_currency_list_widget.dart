import 'package:conversor_moedas/model/moeda_model.dart';
import 'package:conversor_moedas/pages/conversao_page.dart';
import 'package:conversor_moedas/widgets/custom_currency_list_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class CustomCurrencyListWidget extends StatelessWidget {
  final List<Moeda>? currencies;

  const CustomCurrencyListWidget({super.key, this.currencies});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(24.0, 0, 24.0, 24.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.5),
        borderRadius: BorderRadius.circular(25),
      ),
      child: ListView.builder(
        padding: const EdgeInsets.fromLTRB(0.0, 12, 0.0, 12.0),
        itemCount: currencies?.length ?? 0,
        itemBuilder: (_, idx) => InkWell(
          onTap: () {
            if (currencies != null && idx < currencies!.length) {
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.rightToLeft,
                  child: ConversaoPage(currency: currencies![idx]),
                ),
              );
            }
          },
          child: CustomCurrencyListItem(currency: currencies![idx]),
        ),
      ),
    );
  }
}
