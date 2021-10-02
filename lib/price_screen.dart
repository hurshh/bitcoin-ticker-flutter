import 'dart:io';
import 'dart:math';
import 'prices.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:bitcoin_ticker/coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'INR';
  double BTCcost = 0;
  double ETHcost = 0;
  double LTCcost = 0;
  cryptoPrices price = new cryptoPrices();
  DropdownButton<String> getMaterialDroplist(){
    List<DropdownMenuItem<String>> dropdownItems = [];
    for(String str in currenciesList){
      dropdownItems.add(DropdownMenuItem(
        child: Text(str),
        value: str,
      ));
    }
    return DropdownButton<String>(
      dropdownColor: Colors.blue,
      value: selectedCurrency,
      items: dropdownItems,
      onChanged: (value) async {
        print(value);
        double cost = await price.getBTC(selectedCurrency);
        double eth = await price.getETH(selectedCurrency);
        double ltc = await price.getLTC(selectedCurrency);
        print(cost);
        setState(() {
          selectedCurrency = value;
          BTCcost = cost.roundToDouble();
          ETHcost = eth.roundToDouble();
          LTCcost = ltc.roundToDouble();
        });

      },
    );
  }
  CupertinoPicker getCupertinoPicker(){
    List<Text> arr = [];
    for(String str in currenciesList){
      arr.add(
          Text(str)
      );
    }
    return CupertinoPicker(itemExtent: 32.0,onSelectedItemChanged: (selectedIndex){print(selectedIndex);},
    children: arr);
  }
  Widget getPicker(){
    if(Platform.isIOS){
      return getCupertinoPicker();
    }
    else if(Platform.isAndroid){
      return getMaterialDroplist();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('COIN TICKER')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = ${BTCcost.toString()} ${selectedCurrency}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 ETH = ${ETHcost.toString()} ${selectedCurrency}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 LTC = ${LTCcost.toString()} ${selectedCurrency}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 100.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: getPicker(),
          ),
        ],
      ),
    );
  }
}

