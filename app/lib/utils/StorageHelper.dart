import 'dart:convert';
import 'dart:io';

class StorageHelper {
  final String filePath;

  StorageHelper(this.filePath);

  Future<Map<String, dynamic>> readData() async {
    try {
      final file = File(filePath);
      if (await file.exists()) {
        final content = await file.readAsString();
        return json.decode(content);
      } else {
        return {"users": [], "loggedInUser": null};
      }
    } catch (e) {
      throw Exception("Error reading file: $e");
    }
  }

  Future<void> writeData(Map<String, dynamic> data) async {
    try {
      final file = File(filePath);
      await file.writeAsString(json.encode(data));
    } catch (e) {
      throw Exception("Error writing file: $e");
    }
  }
}
