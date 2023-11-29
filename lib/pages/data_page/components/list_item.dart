import 'package:flutter/material.dart';
import '../../../stores/list_store.dart';
import '../../../utils/texts.dart';

class ListItem extends StatelessWidget {
  const ListItem(
      {super.key,
      required this.index,
      required this.text,
      required this.listStore});

  final int index;
  final String? text;
  final ListStore listStore;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      title: Text(text!, style: Texts.bodyMediumBlack(context)),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            color: Colors.green,
            onPressed: () {},
            icon: const Icon(Icons.edit_rounded),
          ),
          IconButton(
            color: Colors.red,
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (_) {
                    return confirmDeleteDialog(context);
                  });
            },
            icon: const Icon(Icons.clear),
          ),
        ],
      ),
    );
  }

  AlertDialog confirmDeleteDialog(BuildContext context) {
    return AlertDialog(
      title: const Text('Excluir texto?'),
      content: const Text('Tem certeza que deseja excluir este texto?'),
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(context), child: const Text('Não')),
        TextButton(
            onPressed: () async {
              Navigator.pop(context);
              listStore.deleteItem(index);
            },
            child: const Text('Sim')),
      ],
    );
  }
}
