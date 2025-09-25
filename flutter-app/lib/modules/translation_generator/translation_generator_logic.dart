import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class TranslationGeneratorLogic {
  Future<Map<String, dynamic>> loadExistingTranslations() async {
    final String response = await rootBundle.loadString('assets/translations/en-GB.json');
    final data = await json.decode(response);
    return data;
  }

  Map<String, dynamic> generateItalianTranslation(Map<String, TextEditingController> controllers) {
    final Map<String, String> flatTranslations = {};
    controllers.forEach((key, controller) {
      if (controller.text.isNotEmpty) {
        flatTranslations[key] = controller.text;
      }
    });

    return _unflattenTranslations(flatTranslations);
  }

  Map<String, dynamic> _unflattenTranslations(Map<String, String> flatMap) {
    final Map<String, dynamic> nestedMap = {};
    flatMap.forEach((key, value) {
      final keys = key.split('.');
      Map<String, dynamic> currentLevel = nestedMap;
      for (int i = 0; i < keys.length - 1; i++) {
        final currentKey = keys[i];
        if (!currentLevel.containsKey(currentKey)) {
          currentLevel[currentKey] = <String, dynamic>{};
        }
        currentLevel = currentLevel[currentKey];
      }
      currentLevel[keys.last] = value;
    });
    return nestedMap;
  }
}