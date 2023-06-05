import 'package:conversor_moedas/controllers/moedas_controller.dart';
import 'package:conversor_moedas/pages/conversao_page.dart';
import 'package:conversor_moedas/repositories/moedas_repository_imp.dart';
import 'package:conversor_moedas/service/dio_service_imp.dart';
import 'package:conversor_moedas/widgets/custom_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../model/usd_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

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
                List<USD>? currencies = _controller.getCurrencyList();
                return Container(
                  color: Colors.indigo,
                  child: Stack(
                    children: [
                      Center(
                        child: Image.asset(
                          'assets/img/imgFundoDinheiro.png',
                          width: 400,
                          height: 400,
                        ),
                      ),
                      Column(
                        children: [
                          SizedBox(height: 30.0),
                          Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.monetization_on_outlined,
                                  color: Colors.white,
                                  size: 100,
                                ),
                                SizedBox(width: 8.0),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RichText(
                                      text: const TextSpan(
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: 'Conversor de ',
                                              style: TextStyle(
                                                  color: Colors.white)),
                                          TextSpan(
                                              text: 'moedas',
                                              style: TextStyle(
                                                  color: Colors.cyan)),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      'Toodoo - Desenvolvimento de Software',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.fromLTRB(
                                  24.0, 0, 24.0, 24.0),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: ListView.builder(
                                itemCount: currencies?.length ?? 0,
                                itemBuilder: (_, idx) => InkWell(
                                  onTap: () {
                                    if (currencies != null &&
                                        idx < currencies.length) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ConversaoPage(
                                              currency: currencies[idx]),
                                        ),
                                      );
                                    }
                                    // Caso contrário, você pode escolher lidar com este caso como quiser.
                                  },
                                  child: Container(
                                    height: 57,
                                    margin: const EdgeInsets.fromLTRB(
                                        24.0, 8.0, 24.0, 8.0),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.0),
                                      border: Border.all(
                                        color: Colors.white.withOpacity(0.5),
                                        width: 2,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          8.0, 15.0, 0.0, 0),
                                      child: Text(
                                        currencies?[idx].name.toString() ??
                                            'Sem valor',
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight:
                                              FontWeight.bold, // Make text bold
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
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
