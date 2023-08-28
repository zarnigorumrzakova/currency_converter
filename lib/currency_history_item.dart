import 'package:currency_converter/app_helpers.dart';
import 'package:currency_converter/converter_page.dart';
import 'package:currency_converter/currency.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CurrencyHistoryItem extends StatelessWidget {
  final Currency currency;
  final String locale;

  const CurrencyHistoryItem({
    super.key,
    required this.currency,
    required this.locale,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white.withOpacity(0.2),
      padding: const EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        children: [
          Expanded(
            child: Text(
              '${currency.date}',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                NumberFormat.currency(symbol: 'UZS  ').format(
                  double.tryParse('${currency.rate} '),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                '${(currency.diff?.startsWith('-') ?? false) ? '${currency.diff}' : '+${currency.diff}'}',
                style: TextStyle(
                    color: (currency.diff?.startsWith('-') ?? false)
                        ? Colors.red[800]
                        : Colors.green[800]),
              ),
              SizedBox(
                width: 20,
              ),
              (currency.diff?.startsWith('-') ?? false)
                  ? Icon(
                      Icons.south_east,
                      color: Colors.red[800],
                    )
                  : Icon(
                      Icons.north_east,
                      color: Colors.green[700],
                    ),
            ],
          ),
        ],
      ),
    );
  }
}
