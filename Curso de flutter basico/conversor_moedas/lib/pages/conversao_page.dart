import 'package:conversor_moedas/widgets/custom_background_widget.dart';
import 'package:conversor_moedas/widgets/custom_header_widget.dart';
import 'package:flutter/material.dart';
import '../model/moeda_model.dart';

class ConversaoPage extends StatefulWidget {
  final Moeda currency;

  const ConversaoPage({Key? key, required this.currency}) : super(key: key);

  @override
  State<ConversaoPage> createState() => _ConversaoPageState();
}

class _ConversaoPageState extends State<ConversaoPage> {
  final TextEditingController _controller = TextEditingController();
  double? _result;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_updateResult);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _updateResult() {
    if (_controller.text.isNotEmpty) {
      final double value = double.tryParse(_controller.text) ?? 0.0;
      setState(() {
        _result = value * widget.currency.buy;
      });
    } else {
      setState(() {
        _result = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
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
                          controller: _controller,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            labelText: 'Quantidade em ${widget.currency.name}',
                          ),
                          keyboardType:
                              TextInputType.numberWithOptions(decimal: true),
                        ),
                        const SizedBox(height: 24.0),
                        if (_result != null)
                          Container(
                            child: TextField(
                              enabled:
                                  false, // desabilita a edição do TextField
                              controller: TextEditingController()
                                ..text =
                                    'R\$: ${_result!.toStringAsFixed(2)}', // define o valor do resultado
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                labelText: 'Resultado em reais',
                              ),
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
