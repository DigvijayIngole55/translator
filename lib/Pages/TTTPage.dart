import 'package:flutter/material.dart';
import 'package:language_pickers/language_picker_dropdown.dart';
import 'package:translator/translator.dart';
import 'package:translatron/Services/Translation.dart';
import 'package:language_pickers/languages.dart';
import 'package:clipboard/clipboard.dart';

class TTTPage extends StatefulWidget {
  @override
  _TTTPageState createState() => _TTTPageState();
}

class _TTTPageState extends State<TTTPage> {

  String LanguageToTranslate = 'en';
  String LanguageFromTranslate = 'en';
  String TextTotranslate;
  var TranslatedText;

  TextEditingController _controller = new TextEditingController();
@override
  void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 4,
            child: Material(
              elevation: 5.0,
              color: Colors.grey[700],
              borderRadius: BorderRadius.circular(5.0),
              child: Container(
                padding: EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(flex: 1,child: LanguagePickerDropdown(
                      initialValue: LanguageFromTranslate,
                      onValuePicked: (value){
                        LanguageFromTranslate = value.isoCode;
                        setState(() {

                        });
                      },
                    ),),
                    Expanded(
                      flex: 6,
                      child: Material(
                        elevation: 5.0,
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(5.0),
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: TextFormField(
                              onChanged: (value){
                                TextTotranslate = value;
                              },
                              maxLines: 100,
                              decoration: InputDecoration(
                                  focusedBorder: InputBorder.none,
                                  border: InputBorder.none,
                                  hintText: "Enter text to be translated"),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Expanded(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 90.0),
            child: GestureDetector(
              onTap: ()async{
                print(LanguageFromTranslate);
                print(LanguageToTranslate);
                print(TextTotranslate);
                var wassup = await translation(LanguageFromTranslate, LanguageToTranslate, TextTotranslate,);
                setState(() {
                  TranslatedText = wassup.toString();
                  _controller.text = TranslatedText;
                });
              },
              child: Material(
                elevation: 5.0,
                color: Colors.orangeAccent,
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
                  child: Center(
                    child: Text(
                      'Translate',
                      style: TextStyle(fontFamily: "Norwester", fontSize: 24.0),
                    ),
                  ),
                ),
              ),
            ),
          )),
          SizedBox(
            height: 20.0,
          ),
          Expanded(
            flex: 4,
            child: Material(
              elevation: 5.0,
              color: Colors.grey[700],
              borderRadius: BorderRadius.circular(5.0),
              child: Container(
                padding: EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(flex: 1, child: Row(
                      children: [
                        LanguagePickerDropdown(
                          initialValue: LanguageToTranslate,
                          onValuePicked: (value){
                            LanguageToTranslate = value.isoCode;
                            setState(() {
                            });
                          },
                        ),
                        SizedBox(width: 50.0,),
                        GestureDetector(onTap:(){
                          FlutterClipboard.copy(TranslatedText).then(( value ) => print('copied'));},
                            child: Icon(Icons.copy))
                      ],
                    )),
                    Expanded(
                      flex: 6,
                      child: Material(
                        elevation: 5.0,
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(5.0),
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: TextFormField(
                              controller: _controller,
                              onChanged: (value){
                                TranslatedText = value;
                                setState(() {
                                });
                              },
                              maxLines: 100,
                              decoration: InputDecoration(
                                hintText: 'Translated Text',
                                  focusedBorder: InputBorder.none,
                                  border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
