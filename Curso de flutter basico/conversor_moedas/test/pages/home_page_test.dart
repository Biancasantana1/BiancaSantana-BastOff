import 'package:conversor_moedas/repositories/moedas_repository_imp.dart';
import 'package:conversor_moedas/service/dio_service_imp.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:conversor_moedas/pages/home_page.dart';
import 'package:lottie/lottie.dart';
import 'package:mocktail/mocktail.dart';

class DioServiceMock extends Mock implements DioServiceImp {}

class DioMock extends Mock implements Dio {}

void main() {
  final dioMock = DioMock();
  final dioServiceMock = DioServiceMock();
  final moedas = MoedasRepositoryImp(dioServiceMock);

  when(() => dioServiceMock.getDio()).thenReturn(dioMock);

  when(() => dioMock.get(any())).thenAnswer(
    (_) async => Response(
      data: jsonDecode(jsonReturn),
      statusCode: 200,
      requestOptions: RequestOptions(
        path: 'path',
      ),
    ),
  );

  testWidgets('Testando renderização do widget Lottie',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
        home:
            Scaffold(body: Center(child: Lottie.asset('assets/lottie.json')))));

    expect(find.byType(Lottie), findsOneWidget);
  });

  testWidgets('Testando renderização da lista de moedas',
      (WidgetTester tester) async {
    // final result = await moedas.getMoedas();
    // List<Moeda>? currencies =
    //     result.results.currencies.currencyMap.values.toList();

    await tester.pumpWidget(MaterialApp(home: HomePage()));

    //expect(find.byType(Lottie), findsOneWidget);

    //await tester.pump(Duration(seconds: 8));

    // expect(find.byType(CustomCurrencyListItem), findsNothing);
  });
}

const jsonReturn =
    '{"by":"default","valid_key":true,"results":{"currencies":{"source":"BRL","USD":{"name":"Dollar","buy":4.8564,"sell":4.8561,"variation":-1.293},"EUR":{"name":"Euro","buy":5.3266,"sell":5.3254,"variation":-0.579},"GBP":{"name":"Pound Sterling","buy":6.2326,"sell":null,"variation":-0.575},"ARS":{"name":"Argentine Peso","buy":0.0186,"sell":null,"variation":-1.54},"CAD":{"name":"Canadian Dollar","buy":3.6572,"sell":null,"variation":-0.657},"AUD":{"name":"Australian Dollar","buy":3.2493,"sell":null,"variation":-0.328},"JPY":{"name":"Japanese Yen","buy":0.0342,"sell":null,"variation":-0.112},"CNY":{"name":"Renminbi","buy":0.6725,"sell":null,"variation":-0.896},"BTC":{"name":"Bitcoin","buy":156204.152,"sell":156204.152,"variation":0.391}},"stocks":{"IBOVESPA":{"name":"BM\u0026F BOVESPA","location":"Sao Paulo, Brazil","points":118972.01,"variation":1.32},"IFIX":{"name":"Índice de Fundos de Investimentos Imobiliários B3","location":"Sao Paulo, Brazil","points":3189.8,"variation":0.4},"NASDAQ":{"name":"NASDAQ Stock Market","location":"New York City, United States","points":13754.19,"variation":0.55},"DOWJONES":{"name":"Dow Jones Industrial Average","location":"New York City, United States","points":33907.26,"variation":-0.04},"CAC":{"name":"CAC 40","location":"Paris, French","points":7111.88,"variation":0.42},"NIKKEI":{"name":"Nikkei 225","location":"Tokyo, Japan","points":32388.42,"variation":-1.17}},"available_sources":["BRL"],"bitcoin":{"blockchain_info":{"name":"Blockchain.info","format":["USD","en_US"],"last":30348.17,"buy":30348.17,"sell":30348.17,"variation":0.405},"coinbase":{"name":"Coinbase","format":["USD","en_US"],"last":30329.855,"variation":0.312},"bitstamp":{"name":"BitStamp","format":["USD","en_US"],"last":30337.0,"buy":30335.0,"sell":30334.0,"variation":0.331},"foxbit":{"name":"FoxBit","format":["BRL","pt_BR"],"last":148267.0497,"variation":-0.85},"mercadobitcoin":{"name":"Mercado Bitcoin","format":["BRL","pt_BR"],"last":148161.99999999,"buy":148161.99999999,"sell":148162.0,"variation":-0.845}},"taxes":[{"date":"2023-07-06","cdi":13.75,"selic":13.75,"daily_factor":1.00050788,"selic_daily":13.65,"cdi_daily":13.65}]},"execution_time":0.0,"from_cache":true}';
