import 'dart:async';

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:maka/screen/addOrder.dart';
import 'package:maka/screen/filterScreen.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

bool hasSpeech = false;
BuildContext speechcontext;
double level = 0.0;
double minSoundLevel = 50000;
double maxSoundLevel = -50000;
String lastWords = "";
String lastError = "";
String lastStatus = "";
String currentLocaleId = "";
List<LocaleName> _localeNames = [];
final SpeechToText speech = SpeechToText();

StreamController streamController2 = new StreamController<String>();

class NumbersDigits {
  String name;
  String digit;
  NumbersDigits({this.name, this.digit});
}

List<NumbersDigits> numbers = [];
// Map<String, String> numbers = {
//   'واحد': "1",
//   'اثنين': "2",
//   'ثلاثه': "3",
//   'اربعه': "4",
//   'خمسه': "5",
//   'سته': "6",
//   'سبعه': "7",
//   'ثمانيه': "8",
//   'تسعه': "9",
//   'عشره': "10",
// };

Future<void> initSpeechState() async {
  bool hasSpeech2 =
      await speech.initialize(onError: errorListener, onStatus: statusListener);
  if (hasSpeech) {
    _localeNames = await speech.locales();

    var systemLocale = await speech.systemLocale();
    currentLocaleId = systemLocale.localeId;
  }

  // if (!mounted) return;

  // setState(() {
  hasSpeech = hasSpeech2;
  // });
}

void stopListening() {
  speech.stop();
  //  setState(() {
  level = 0.0;
  // });
}

void cancelListening() {
  speech.cancel();
  // setState(() {
  level = 0.0;
  //});
}

Future startListening() async {
  lastWords = "";
  lastError = "";
  await speech
      .listen(
          onResult: await (result) async {
            await resultListener(result);
            print(result.recognizedWords);
          },
          listenFor: Duration(seconds: 10),
          localeId: 'ar_EG',
          onSoundLevelChange: soundLevelListener,
          cancelOnError: true,
          listenMode: ListenMode.confirmation)
      .whenComplete(() {});
  print("vvvvv");
  //  setState(() {});
}

resultListener(SpeechRecognitionResult result) {
  //  setState(() {
  // BuildContext context;
  lastWords = "${result.recognizedWords}"; //- ${result.finalResult}";
  // streamController2 = new StreamController<String>();
  streamController2.sink.add(lastWords);
  print(lastWords);
  if (lastWords == 'اضافه طلبيه') {
    Navigator.push(
      speechcontext,
      MaterialPageRoute(
          builder: (context) => AddOrderScreen()), //FilterScreenPage()),
    );
  } else if (lastWords == 'استعلام مشتريات') {
    Navigator.push(
      speechcontext,
      MaterialPageRoute(
          builder: (context) => FilterScreenPage()), //FilterScreenPage()),
    );
  }

  //  });
}

void soundLevelListener(double level) {
  minSoundLevel = min(minSoundLevel, level);
  maxSoundLevel = max(maxSoundLevel, level);
  // print("sound level $level: $minSoundLevel - $maxSoundLevel ");
  // setState(() {
  //  this.level = level;
  //  });
}

void errorListener(SpeechRecognitionError error) {
  // print("Received error status: $error, listening: ${speech.isListening}");
  // setState(() {
  lastError = "${error.errorMsg} - ${error.permanent}";
  //  });
}

void statusListener(String status) {
  // print(
  // "Received listener status: $status, listening: ${speech.isListening}");
  //   setState(() {
  lastStatus = "$status";
  //   });
}

_switchLang(selectedVal) {
  //   setState(() {
  currentLocaleId = selectedVal;

  // });
  print(selectedVal);
}
