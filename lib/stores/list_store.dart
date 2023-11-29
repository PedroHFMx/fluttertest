import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'list_store.g.dart';

class ListStore = NewListStore with _$ListStore;

abstract class NewListStore with Store {
  late SharedPreferences prefs;

  @observable
  List<String>? itemsList = [];

  @action
  getItems() async {
    prefs = await SharedPreferences.getInstance();
    List<String>? list = prefs.getStringList('texts');
    itemsList = list ?? [];
  }

  @action
  addItem(String value, TextEditingController controller) async {
    itemsList!.add(value);
    await prefs.setStringList('texts', itemsList!);
    controller.clear();
  }

  @action
  deleteItem(int index) async {
    itemsList!.removeAt(index);
    await prefs.setStringList('texts', itemsList!);
  }
}
