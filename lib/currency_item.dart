import 'package:currency_converter/app_helpers.dart';
import 'package:currency_converter/converter_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'currency.dart';

class CurrencyItem extends StatelessWidget {
  final Currency currency;
  final String locale;

  const CurrencyItem({super.key, required this.currency, required this.locale});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => ConverterPage(currency: currency,locale: locale,)),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                 AppHelpers.getCurrencyTitleByLocale(currency, locale),
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  NumberFormat.currency(symbol: 'UZS')
                      .format(double.tryParse('${currency.rate}')),
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${currency.ccy}',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Row(
                  children: [
                    (currency.diff?.startsWith('-') ?? false)
                        ? const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.red,
                    )
                        : const Icon(
                      Icons.keyboard_arrow_up,
                      color: Colors.green,
                    ),
                    Text(
                      '${currency.diff}',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}