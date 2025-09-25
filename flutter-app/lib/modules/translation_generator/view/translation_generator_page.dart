import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:universal_html/html.dart' as html;
import 'package:flutter/material.dart';
import '../translation_generator_logic.dart';

class TranslationGeneratorPage extends StatefulWidget {
  const TranslationGeneratorPage({super.key});

  @override
  State<TranslationGeneratorPage> createState() => _TranslationGeneratorPageState();
}

class _TranslationGeneratorPageState extends State<TranslationGeneratorPage> {
  final TranslationGeneratorLogic _logic = TranslationGeneratorLogic();
  Map<String, dynamic> _existingTranslations = {};
  final Map<String, TextEditingController> _controllers = {};

  @override
  void initState() {
    super.initState();
    _loadTranslations();
  }

  Future<void> _loadTranslations() async {
    final translations = await _logic.loadExistingTranslations();
    setState(() {
      _existingTranslations = _flattenTranslations(translations);
      _existingTranslations.forEach((key, value) {
        _controllers[key] = TextEditingController();
      });
    });
  }

  Map<String, dynamic> _flattenTranslations(Map<String, dynamic> json, [String prefix = '']) {
    final Map<String, dynamic> flatMap = {};
    json.forEach((key, value) {
      final newKey = prefix.isEmpty ? key : '$prefix.$key';
      if (value is Map<String, dynamic>) {
        flatMap.addAll(_flattenTranslations(value, newKey));
      } else {
        flatMap[newKey] = value;
      }
    });
    return flatMap;
  }

  void _generateAndDownloadJson() {
    final italianTranslations = _logic.generateItalianTranslation(_controllers);
    final jsonString = const JsonEncoder.withIndent('  ').convert(italianTranslations);

    if (kIsWeb) {
      final bytes = utf8.encode(jsonString);
      final blob = html.Blob([bytes]);
      final url = html.Url.createObjectUrlFromBlob(blob);
      final anchor = html.AnchorElement(href: url)
        ..setAttribute("download", "it-IT.json")
        ..click();
      html.Url.revokeObjectUrl(url);
    } else {
      // Per piattaforme non web, potremmo salvare su file o mostrare un dialogo
      // Qui, per semplicità, stampiamo sulla console.
      print(jsonString);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Translation Generator'),
      ),
      body: _buildTranslationForm(),
      floatingActionButton: FloatingActionButton(
        onPressed: _generateAndDownloadJson,
        child: const Icon(Icons.download),
        tooltip: 'Generate and Download JSON',
      ),
    );
  }

  Widget _buildTranslationForm() {
    if (_existingTranslations.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: _existingTranslations.keys.length,
      itemBuilder: (context, index) {
        final key = _existingTranslations.keys.elementAt(index);
        final value = _existingTranslations[key];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(key, style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8.0),
                Text('English: $value'),
                const SizedBox(height: 8.0),
                TextFormField(
                  controller: _controllers[key],
                  decoration: const InputDecoration(
                    labelText: 'Italian Translation',
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

    @override
  void dispose() {
    _controllers.values.forEach((controller) => controller.dispose());
    super.dispose();
  }
}