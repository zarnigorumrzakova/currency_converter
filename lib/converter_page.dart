import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';


import 'app_helpers.dart';
import 'currency.dart';

class ConverterPage extends StatefulWidget {
  final Currency currency;
  final String locale;

  const ConverterPage({super.key, required this.currency, required this.locale});

  @override
  State<ConverterPage> createState() => _ConverterPageState();

}

class _ConverterPageState extends State<ConverterPage> {
  double _calculatedSum = 0;


  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text( AppHelpers.getCurrencyTitleByLocale(widget.currency, widget.locale)),
      ),
      body: Column(
        children: [
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                TextFormField(
                  onChanged: (value){
                    setState(() {
                      _calculatedSum = double.parse(value) *
                      double.parse(widget.currency.rate ?? '');
                    });
                  },
                  decoration:  const InputDecoration(
                    labelText: 'Enter the value'
                  ),
                ),
                 const SizedBox(height: 24,),
                Text( NumberFormat.currency(symbol: 'UZS').format(_calculatedSum)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}