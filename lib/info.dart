import 'dart:async';
import 'dart:convert';
import 'package:finance/home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'coinModel.dart';
import 'coinCard.dart';
import 'package:charts_flutter/flutter.dart' as charts;


class PricePoint {
  final DateTime date;
  final double price;

  PricePoint(this.date, this.price);
}

class info extends StatefulWidget {
  const info({Key? key}) : super(key: key);

  @override
  State<info> createState() => _infoState();
}

class _infoState extends State<info> {

  List<charts.Series<PricePoint, DateTime>> _seriesList = [];
  Future<List<PricePoint>> fetchPriceData() async {
    final response = await http.get(Uri.parse(
        'https://api.coingecko.com/api/v3/coins/$id/market_chart?vs_currency=usd&days=30'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final prices = data['prices'] as List<dynamic>;

      return prices
          .map((price) => PricePoint(
        DateTime.fromMillisecondsSinceEpoch(price[0]),
        price[1].toDouble(),
      ))
          .toList();
    } else {
      throw Exception('Failed to fetch price data');
    }
  }

  void initState() {
    super.initState();
    fetchPriceData().then((data) {
      setState(() {
        _seriesList = [
          charts.Series<PricePoint, DateTime>(
            id: 'Bitcoin Price',
            colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
            domainFn: (PricePoint point, _) => point.date,
            measureFn: (PricePoint point, _) => point.price,
            data: data,
          ),
        ];
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: Text('$id Price Chart', style: TextStyle(
          color: Colors.grey[900],
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: charts.TimeSeriesChart(
          _seriesList,
          animate: true,
          dateTimeFactory: const charts.LocalDateTimeFactory(),
        ),
      ),
    );

  }
}
