import 'package:translator/translator.dart';

  Future translation(String lang1,String lang2,String text1,)async {
    var text2;
  final translator = GoogleTranslator();

  text2 = await translator.translate(text1, from: lang1, to: lang2);
  print(text2);
  return text2;
}