import 'package:get/get.dart';
import 'package:nutech/app/data/providers/user_provider.dart';

class ProfileController extends GetxController {
  Future getProfile(String tokens,) async {
    try {
      var response = await UserProvider().getProfile(tokens);
      // return response;

      // print('${response.statusCode}anjing ');
      if (response.statusCode == 200) {
        // Iterable it = jsonDecode(response.body);
        var body = response.body as Map;

        return body;
      }
    } catch (e) {
      print(e.toString());
      print('dla');
    }
  }
}
