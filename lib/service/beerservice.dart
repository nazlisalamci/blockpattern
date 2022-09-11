import 'package:blockpattern/model/beer.dart';
import 'package:http/http.dart' as http;

class BeerService {
  final String _url = "https://api.punkapi.com/v2/beers";

  Future<Beer> getBeer() async {

    final response = await http.get(Uri.parse(_url));
    if (response.statusCode == 200) {
      return Beer.fromJson(response.headers);
    } else {
      throw Exception("Failed to load");
    }
  }
}
