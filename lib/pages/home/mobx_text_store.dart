import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'mobx_text_store.g.dart';

class MobxTextStore = _MobxTextStoreBase with _$MobxTextStore;

abstract class _MobxTextStoreBase with Store {
  final String textListKey = 'textList';
  late SharedPreferences _preferences;

  @observable
  int editingIndex = -1;

  @action
  void setEditingIndex(int index) {
    editingIndex = index;
  }

  @action
  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  @observable
  ObservableList<String> textList = ObservableList<String>();

  @action
  void addText(String text) {
    textList.add(text);
    _saveData();
  }

  @action
  void removeText(int index) {
    textList.removeAt(index);
    _saveData();
  }

  @action
  void editText(int index, String newText) {
    if (index >= 0 && index < textList.length) {
      textList[index] = newText;
      _saveData();
    }
  }

  void _saveData() {
    _preferences.setStringList(textListKey, textList.toList());
  }

  void loadData() {
    final List<String>? savedList = _preferences.getStringList(textListKey);
    if (savedList != null) {
      textList = ObservableList<String>.of(savedList);
    }
  }
}
