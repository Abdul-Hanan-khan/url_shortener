import 'dart:convert';

UrlShortnerResponse urlShortnerResponseFromJson(String str) => UrlShortnerResponse.fromJson(json.decode(str));

String urlShortnerResponseToJson(UrlShortnerResponse data) => json.encode(data.toJson());

class UrlShortnerResponse {
  String ?resultUrl;
  UrlShortnerResponse({
    this.resultUrl,
  });



  factory UrlShortnerResponse.fromJson(Map<String, dynamic> json) => UrlShortnerResponse(
    resultUrl: json["result_url"],
  );

  Map<String, dynamic> toJson() => {
    "result_url": resultUrl,
  };
}