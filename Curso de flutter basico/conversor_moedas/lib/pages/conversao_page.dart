import 'package:conversor_moedas/controllers/conversao_controller.dart';
import 'package:conversor_moedas/model/moeda_model.dart';
import 'package:conversor_moedas/widgets/custom_background_widget.dart';
import 'package:conversor_moedas/widgets/custom_header_widget.dart';
import 'package:flutter/material.dart';

class ConversaoPage extends StatefulWidget {
  final Moeda currency;

  const ConversaoPage({Key? key, required this.currency}) : super(key: key);

  @override
  State<ConversaoPage> createState() => _ConversaoPageState();
}

class _ConversaoPageState extends State<ConversaoPage> {
  late final ConversaoController _conversaoController;

  @override
  void initState() {
    super.initState();
    _conversaoController = ConversaoController();
    _conversaoController.controller.addListener(() {
      setState(() {
        _conversaoController.updateResult(widget.currency.buy);
      });
    });
  }

  @override
  void dispose() {
    _conversaoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    String currencySymbol =
        _conversaoController.currencySymbols[widget.currency.name] ?? '';
    return Scaffold(
      body: Stack(
        children: [
          CustomBackgroundWidget(child: Container()),
          SingleChildScrollView(
            child: Column(
              children: [
                if (!isLandscape) const CustomHeaderWidget(),
                Container(
                  margin: const EdgeInsets.fromLTRB(24.0, 0, 24.0, 24.0),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      children: [
                        TextField(
                          controller: _conversaoController.controller,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            labelText: 'Quantidade em ${widget.currency.name}',
                            prefixText: '$currencySymbol: ',
                          ),
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                        ),
                        const SizedBox(height: 24.0),
                        if (_conversaoController.result != null)
                          TextField(
                            enabled: false,
                            controller: TextEditingController()
                              ..text =
                                  'R\$: ${_conversaoController.result!.toStringAsFixed(2)}',
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Resultado em reais',
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
