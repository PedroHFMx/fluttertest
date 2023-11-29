import 'package:flutter/material.dart';
import 'package:test/components/privacy_policy.dart';
import 'package:test/components/text_form_field.dart';
import 'package:test/pages/data_page/components/list_item.dart';
import 'package:test/stores/list_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class DataPage extends StatefulWidget {
  const DataPage({super.key});

  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  ListStore listStore = ListStore();
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Center(
                  child: ListView(
                padding: const EdgeInsets.all(16),
                shrinkWrap: true,
                children: [
                  Card(
                    margin: const EdgeInsets.all(0),
                    color: Colors.white,
                    child: SizedBox(
                        height: 500,
                        child: Observer(builder: (_) {
                          listStore.getItems();
                          final List<String>? texts = listStore.itemsList;
                          return ListView.separated(
                            separatorBuilder: (context, index) {
                              return const Divider();
                            },
                            itemCount: texts?.length ?? 0,
                            padding: const EdgeInsets.all(16),
                            itemBuilder: (BuildContext context, int index) {
                              return ListItem(
                                index: index,
                                text: texts?[index] ?? '',
                                listStore: listStore,
                              );
                            },
                          );
                        })),
                  ),
                ],
              )),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  textField(),
                  const SizedBox(height: 50),
                  const PrivacyPolicy(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  textField() {
    return CustomTextFormField(
      controller: _controller,
      textCapitalization: TextCapitalization.words,
      onFieldSubmitted: (value) async {
        if (value.trim().isNotEmpty) {
          listStore.addItem(value.trim(), _controller);
        }
      },
    );
  }
}
