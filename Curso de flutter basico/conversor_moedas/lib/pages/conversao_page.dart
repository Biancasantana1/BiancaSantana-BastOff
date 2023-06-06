import 'package:flutter/material.dart';
import '../model/moeda_model.dart';

class ConversaoPage extends StatefulWidget {
  final Moeda currency;

  const ConversaoPage({Key? key, required this.currency}) : super(key: key);

  @override
  State<ConversaoPage> createState() => _ConversaoPageState();
}

class _ConversaoPageState extends State<ConversaoPage> {
  @override
  Widget build(BuildContext context) {
    // Você pode acessar a moeda com widget.currency
    return Container();
  }
}
