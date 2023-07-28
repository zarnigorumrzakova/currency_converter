import 'dart:developer';

import 'package:currency_converter/app_helpers.dart';
import 'package:currency_converter/currency_item.dart';
import 'package:currency_converter/drawer.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'currency.dart';
import 'http_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLoading = false;
  List<Currency> _currencies = [];
  late RefreshController _controller;
  late DateTime _selectedDate;
  String _locale = 'uz';


  @override
  void initState() {
    super.initState();
    _controller = RefreshController();
    _selectedDate = DateTime.now();
    _getCurrencies();

  }

  Future<void> _getCurrencies() async {
    setState(() {
      _isLoading = true;
      _currencies = [];
    });
    final client = GetIt.I.get<HttpService>().client();
    final response = await client.get(
        '/uz/arkhiv-kursov-valyut/json/all/${AppHelpers.getFormattedDate(_selectedDate)}/');
    debugPrint('===> $response');
    setState(() {
      _isLoading = false;
      _currencies = CurrencyResponse.fromJson(response.data).data ?? [];
    });
  }

  Future<void> _refreshCurrencies() async {
    final client = GetIt.I.get<HttpService>().client();
    final response = await client.get(
        '/uz/arkhiv-kursov-valyut/json/all/${AppHelpers.getFormattedDate(_selectedDate)}/');
    debugPrint('===> $response');
    setState(() {
      _currencies = CurrencyResponse.fromJson(response.data).data ?? [];
    });
    _controller.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: HomeDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Currency_converter'),
        actions: [
          IconButton(
              onPressed: () async {
                final DateTime? changedDate = await showDatePicker(
                    context: context,
                    initialDate: _selectedDate,
                    firstDate: (DateTime.now().subtract(Duration(days: 30))),
                    lastDate: DateTime.now());
                if (changedDate != null) {
                  setState(() {
                    _selectedDate = changedDate;
                    _getCurrencies();
                  });
                }
              },
              icon:Icon(Icons.calendar_month) ),
          PopupMenuButton(
              itemBuilder: (_) => [
                    const PopupMenuItem(
                      value: 'uz',
                      child: Text('O\'zbekcha'),
                    ),
                    const PopupMenuItem(
                      value: 'en',
                      child: Text('English'),
                    ),
                    const PopupMenuItem(
                      value: 'ru',
                      child: Text('русский'),
                    ),
                  ],
          onSelected: (value){
                setState(() {
                  _locale = value;
                });
          },),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 40),

          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : SmartRefresher(
                    controller: _controller,
                    onRefresh: _refreshCurrencies,
                    child: ListView.builder(
                      itemCount: _currencies.length,
                      itemBuilder: (context, index) {
                        return CurrencyItem(currency: _currencies[index],
                        locale: _locale,);
                      },
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
