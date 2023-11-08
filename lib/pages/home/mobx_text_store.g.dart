// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mobx_text_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MobxTextStore on _MobxTextStoreBase, Store {
  late final _$editingIndexAtom =
      Atom(name: '_MobxTextStoreBase.editingIndex', context: context);

  @override
  int get editingIndex {
    _$editingIndexAtom.reportRead();
    return super.editingIndex;
  }

  @override
  set editingIndex(int value) {
    _$editingIndexAtom.reportWrite(value, super.editingIndex, () {
      super.editingIndex = value;
    });
  }

  late final _$textListAtom =
      Atom(name: '_MobxTextStoreBase.textList', context: context);

  @override
  ObservableList<String> get textList {
    _$textListAtom.reportRead();
    return super.textList;
  }

  @override
  set textList(ObservableList<String> value) {
    _$textListAtom.reportWrite(value, super.textList, () {
      super.textList = value;
    });
  }

  late final _$initAsyncAction =
      AsyncAction('_MobxTextStoreBase.init', context: context);

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  late final _$_MobxTextStoreBaseActionController =
      ActionController(name: '_MobxTextStoreBase', context: context);

  @override
  void setEditingIndex(int index) {
    final _$actionInfo = _$_MobxTextStoreBaseActionController.startAction(
        name: '_MobxTextStoreBase.setEditingIndex');
    try {
      return super.setEditingIndex(index);
    } finally {
      _$_MobxTextStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addText(String text) {
    final _$actionInfo = _$_MobxTextStoreBaseActionController.startAction(
        name: '_MobxTextStoreBase.addText');
    try {
      return super.addText(text);
    } finally {
      _$_MobxTextStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeText(int index) {
    final _$actionInfo = _$_MobxTextStoreBaseActionController.startAction(
        name: '_MobxTextStoreBase.removeText');
    try {
      return super.removeText(index);
    } finally {
      _$_MobxTextStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void editText(int index, String newText) {
    final _$actionInfo = _$_MobxTextStoreBaseActionController.startAction(
        name: '_MobxTextStoreBase.editText');
    try {
      return super.editText(index, newText);
    } finally {
      _$_MobxTextStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
editingIndex: ${editingIndex},
textList: ${textList}
    ''';
  }
}
