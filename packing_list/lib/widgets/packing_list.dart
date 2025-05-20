import 'package:flutter/material.dart';
import 'package:packing_list/models/item.dart';
import 'package:packing_list/widgets/new_item.dart';

class PackingList extends StatefulWidget {
  const PackingList({super.key});

  @override
  State<PackingList> createState() => _PackingListState();
}

class _PackingListState extends State<PackingList> {
  final List<Item> _items = [];

  void _addItem() async {
    final newItem = await Navigator.of(context).push<Item>(
      MaterialPageRoute(
        builder: (ctx) => const NewItem(),
      ),
    );
    if (newItem == null) {
      return;
    }
    setState(() {
      _items.add(newItem);
    });
  }

  void _removeItem(Item item) {
    setState(() {
      _items.remove(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your packing list'),
      ),
      body: _items.isEmpty
          ? const Center(
              child: Text("List is empty"),
            )
          : ListView.builder(
              itemBuilder: (ctx, index) => Dismissible(
                key: ValueKey(_items[index].id),
                onDismissed: (direction) {
                  _removeItem(_items[index]);
                },
                child: ListTile(
                  title: Text(_items[index].name),
                  leading: Container(
                      width: 48,
                      height: 48,
                      color: _items[index].category.color),
                  trailing: Text(_items[index].quantity.toString()),
                ),
              ),
              itemCount: _items.length,
            ),
      bottomNavigationBar: BottomAppBar(
        child: Center(
          child: ElevatedButton(
            onPressed: _addItem,
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: const Color.fromARGB(255, 42, 51, 59), // Text color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30), // Rounded corners
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                'Add Item',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
