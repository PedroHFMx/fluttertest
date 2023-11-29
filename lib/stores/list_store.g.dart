// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ListStore on NewListStore, Store {
  late final _$itemsListAtom =
      Atom(name: 'NewListStore.itemsList', context: context);

  @override
  List<String>? get itemsList {
    _$itemsListAtom.reportRead();
    return super.itemsList;
  }

  @override
  set itemsList(List<String>? value) {
    _$itemsListAtom.reportWrite(value, super.itemsList, () {
      super.itemsList = value;
    });
  }

  late final _$getItemsAsyncAction =
      AsyncAction('NewListStore.getItems', context: context);

  @override
  Future getItems() {
    return _$getItemsAsyncAction.run(() => super.getItems());
  }

  late final _$addItemAsyncAction =
      AsyncAction('NewListStore.addItem', context: context);

  @override
  Future addItem(String value, TextEditingController controller) {
    return _$addItemAsyncAction.run(() => super.addItem(value, controller));
  }

  late final _$deleteItemAsyncAction =
      AsyncAction('NewListStore.deleteItem', context: context);

  @override
  Future deleteItem(int index) {
    return _$deleteItemAsyncAction.run(() => super.deleteItem(index));
  }

  @override
  String toString() {
    return '''
itemsList: ${itemsList}
    ''';
  }
}
