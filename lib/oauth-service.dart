import 'package:http/http.dart' as http;

class OAuthService {
  OAuthService() {
    foo();
  }

  foo() async {
      http.Response resp = await http.get("http://localhost:4567/data/now");
      print(resp.body);
  }
}