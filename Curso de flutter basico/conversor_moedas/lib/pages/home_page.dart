import 'package:conversor_moedas/controllers/moedas_controller.dart';
import 'package:conversor_moedas/repositories/moedas_repository_imp.dart';
import 'package:conversor_moedas/service/dio_service_imp.dart';
import 'package:conversor_moedas/widgets/custom_background_widget.dart';
import 'package:conversor_moedas/widgets/custom_currency_list_widget.dart';
import 'package:conversor_moedas/widgets/custom_error_widget.dart';
import 'package:conversor_moedas/widgets/custom_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../model/moeda_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MoedasController _controller = MoedasController(
    MoedasRepositoryImp(
      DioServiceImp(),
    ),
  );

  Future<void> get _fetchData async {
    await Future.wait([
      Future.delayed(const Duration(seconds: 3)),
      _controller.fetch(),
    ]);
  }

  void _reloadData() {
    _fetchData;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder(
            future: _fetchData,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: Lottie.asset('assets/lottie.json'));
              } else if (snapshot.hasError) {
                return CustomErrorWidget(
                  errorMessage: snapshot.error.toString(),
                  onRetry: _reloadData,
                );
              } else {
                List<Moeda>? currencies = _controller.getCurrencyList();
                return CustomBackgroundWidget(
                  child: Column(
                    children: [
                      const CustomHeaderWidget(),
                      Expanded(
                        child: CustomCurrencyListWidget(currencies: currencies),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
