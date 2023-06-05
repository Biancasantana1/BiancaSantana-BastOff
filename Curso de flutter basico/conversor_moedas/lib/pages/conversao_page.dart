import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../model/usd_model.dart';

class ConversaoPage extends StatefulWidget {
  final USD currency;

  const ConversaoPage({Key? key, required this.currency}) : super(key: key);

  @override
  State<ConversaoPage> createState() => _ConversaoPageState();
}

class _ConversaoPageState extends State<ConversaoPage> {
  @override
  Widget build(BuildContext context) {
    // Você pode acessar a moeda com widget.currency
    return Placeholder();
  }
}
