import 'package:hive_flutter/hive_flutter.dart';

class SearchHistoryHelper {
  static Future<void> addSearchHistory({required String query}) async {
    var box = Hive.box<String>('searchHistory');

    List<String> history = box.values.toList();

    if (history.contains(query)) {
      history.remove(query);
    }
    history.insert(0, query);

    if (history.length > 10) {
      history.removeLast();
    }

    await box.clear();
    await box.addAll(history);
  }

  static List<String> getSearchHistory() {
    var box = Hive.box<String>('searchHistory');
    if (box.isEmpty) return [];
    return box.values.toList();
  }

  static Future<void> clearSearchHistory() async {
    var box = Hive.box<String>('searchHistory');
    if (box.isEmpty) return;
    await box.clear();
  }

  static Future<void> removeSearchHistory({required String query}) async {
    var box = Hive.box<String>('searchHistory');
    final index = box.values.toList().indexOf(query);
    if (index != -1) {
      await box.deleteAt(index);
    }
  }
}
