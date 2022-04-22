import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_shortener/controller/api.dart';
import 'package:url_shortener/modal/url_shortener_model.dart';

class UrlShortenerState extends ChangeNotifier {
  final urlController = TextEditingController();

  bool loading=false;
  String shortUrlMessage = "Give some long url to convert";

  handleGetLinkButton() async {
    final longUrl = urlController.text;
    loading=true;
    notifyListeners();
    final String ?shortUrl = await getShortLink(longUrl);
    loading=false;
    notifyListeners();
    shortUrlMessage = "$shortUrl";

    notifyListeners();

  }

  Future<String?> getShortLink(String longUrl) async {
    final result = await http.post(Uri.parse(AppApis.BASE_URL+AppApis.SHORTEN_API), body: {"url" : longUrl});

    if(result.statusCode == 200){
      print("Succesfully Completed");

      final response = urlShortnerResponseFromJson(result.body);

      return response.resultUrl;
    }else{
      print("Error in Api");
      print(result.body);
      return "There is some in shortening the url";
    }
  }
}