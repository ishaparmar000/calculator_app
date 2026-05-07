import 'package:get/get.dart';

class LocaleString extends Translations {

  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      "app_name": "Calculator",
      "exit_app": "Exit App",
      "exit_app_msg": "Are you sure you want to exit the app?",
      "yes": "Yes",
      "no": "No",
    },
  };
}
