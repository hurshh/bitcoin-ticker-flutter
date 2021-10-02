import 'dart:convert';

import 'package:http/http.dart';

class cryptoPrices{
  Future getBTC(String currency) async{
    Response res = await get(Uri.parse("https://rest.coinapi.io/v1/exchangerate/BTC/${currency}?apikey=CF056A58-4EC5-4E98-A8DA-7A6933C84E26"));
    double cost =  jsonDecode(res.body)["rate"];
    return cost;
  }
  Future getETH(String currency) async{
    Response res = await get(Uri.parse("https://rest.coinapi.io/v1/exchangerate/ETH/${currency}?apikey=CF056A58-4EC5-4E98-A8DA-7A6933C84E26"));
    double cost =  jsonDecode(res.body)["rate"];
    return cost;
  }
  Future getLTC(String currency) async{
    Response res = await get(Uri.parse("https://rest.coinapi.io/v1/exchangerate/LTC/${currency}?apikey=CF056A58-4EC5-4E98-A8DA-7A6933C84E26"));
    double cost =  jsonDecode(res.body)["rate"];
    return cost;
  }
}