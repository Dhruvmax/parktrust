import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

import '../../core/plate_utils.dart';

/// Reads the number plate from a photo on the phone itself. Nothing is sent
/// anywhere. Returns null if no plate-like text is found.
Future<String?> readPlateFromImage(String path) async {
  final recognizer = TextRecognizer(script: TextRecognitionScript.latin);
  try {
    final result = await recognizer.processImage(InputImage.fromFilePath(path));
    return extractPlate(result.text);
  } catch (_) {
    return null;
  } finally {
    await recognizer.close();
  }
}
