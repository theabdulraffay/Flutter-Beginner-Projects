import 'dart:io' show Platform;

import 'package:bitcoin_livedata/coin_data.dart';
import 'package:bitcoin_livedata/networking.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

const apiKey = '5A63E97B-0A3F-4A4A-A624-2D01619587A1';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrrency = 'USD';
  dynamic currencyData;
  String btc = '?';
  String eth = '?';
  String ltc = '?';

  void updateScreen(String currency) async {
    currencyData = await Networking(currency).getData();
    // print(currencyData);
    if (currencyData != null) {
      // print(currencyData['bitcoin']);
      btc = currencyData['bitcoin'][currency.toLowerCase()].toString();
      eth = currencyData['ethereum'][currency.toLowerCase()].toString();
      ltc = currencyData['litecoin'][currency.toLowerCase()].toString();
    } else {
      print('it is null');
    }
    setState(() {});
    print(btc + eth + ltc);
  }

  DropdownButton<String> androidDropDown() {
    List<DropdownMenuItem<String>>? list = [];
    for (String str in currenciesList) {
      DropdownMenuItem<String>? temp = DropdownMenuItem(
        value: str,
        child: Text(str),
      );
      list.add(temp);
    }

    return DropdownButton<String>(
        value: selectedCurrrency,
        items: list,
        onChanged: (String? value) {
          setState(() {
            selectedCurrrency = value!;
            updateScreen(selectedCurrrency);
          });
          // print(value);
        });
  }

  CupertinoPicker IOSPicker() {
    List<Widget> list = [];
    for (var str in currenciesList) {
      list.add(Text(str));
    }

    return CupertinoPicker(
      useMagnifier: true,
      itemExtent: 32,
      onSelectedItemChanged: (selectedIndex) {
        // print(selectedIndex);
      },
      children: list,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomizableCard(
                currency: 'BTC',
                rate: btc,
              ),
              CustomizableCard(
                currency: 'ETH',
                rate: eth,
              ),
              CustomizableCard(
                currency: 'LTC',
                rate: ltc,
              ),
            ],
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS ? IOSPicker() : androidDropDown(),
          ),
        ],
      ),
    );
  }
}

class CustomizableCard extends StatefulWidget {
  String currency;
  String? rate;
  CustomizableCard({super.key, required this.currency, this.rate});

  @override
  State<CustomizableCard> createState() => _CustomizableCardState();
}

class _CustomizableCardState extends State<CustomizableCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 ${widget.currency} = ${widget.rate ?? '?'}',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
