// ignore_for_file: library_private_types_in_public_api

import 'package:bkopen/app/theme/bkopencolors.dart';
import 'package:bkopen/app/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDropdownSearchPaginated extends FormField<String> {
  final String? selected;
  final String label;
  final String hint;
  final String searchHint;
  final ValueChanged<dynamic> onChanged;
  final Future<List<dynamic>> Function(String query, int page) fetchItems;

  CustomDropdownSearchPaginated({
    super.key,
    required this.label,
    required this.searchHint,
    required this.onChanged,
    required this.fetchItems,
    required this.hint,
    this.selected,
    String? initialValue,
    super.validator,
  }) : super(
          initialValue: initialValue ?? selected,
          builder: (FormFieldState<String> state) {
            return Stack(
              alignment: Alignment.topLeft,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          final selectedItem = await showDialog<String>(
                            context: state.context,
                            builder: (context) => Dialog(
                              insetPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                              child: PaginatedDropdownModal(
                                hint: hint,
                                searchHint: searchHint,
                                fetchItems: fetchItems,
                                onItemSelected: (value) {
                                  state.didChange(value);
                                  onChanged(value);
                                },
                              ),
                            ),
                          );
                          if (selectedItem != null) {
                            state.didChange(selectedItem);
                            onChanged(selectedItem);
                          }
                        },
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.transparent,
                            border: Border.all(
                              color: state.hasError ? Colors.red : BKOpenColors.borderInput,
                            ),
                          ),
                          child: Row(
                            children: <Widget>[
                              
                              Expanded(
                                child: Text(
                                  state.value != null
                                      ? state.value!.isEmpty
                                          ? hint
                                          : state.value!
                                      : hint,
                                  style: Styles.textInput
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(right: 12),
                                child: Icon(Icons.keyboard_arrow_down),
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (state.hasError)
                        Padding(
                          padding: EdgeInsets.only(top: 6.0, left: 10),
                          child: Text(
                            state.errorText ?? '',
                            style:Styles.textInput.copyWith(color: BKOpenColors.accentRed)
                          ),
                        ),
                    ],
                  ),
                ),
                Positioned(
                  left: 20,
                  child: Container(
                    color: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Text(
                      label,
                      style: Styles.textDetails
                      ),
                    ),
                  ),
                
              ],
            );
          },
        );
}

class PaginatedDropdownModal extends StatefulWidget {
  final String hint;
  final String searchHint;
  final Future<List<dynamic>> Function(String query, int page) fetchItems;
  final ValueChanged<String> onItemSelected;

  const PaginatedDropdownModal({
    super.key,
    required this.hint,
    required this.searchHint,
    required this.fetchItems,
    required this.onItemSelected,
  });

  @override
  _PaginatedDropdownModalState createState() => _PaginatedDropdownModalState();
}

class _PaginatedDropdownModalState extends State<PaginatedDropdownModal> {
  final TextEditingController _searchController = TextEditingController();
  List<dynamic> _items = [];
  bool _isLoading = false;
  bool _isNextPageLoading = false;
  int _currentPage = 0;
  String _query = '';

  @override
  void initState() {
    super.initState();
    _loadItems();
    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    setState(() {
      _query = _searchController.text;
      _currentPage = 0;
      _items.clear();
    });
    _loadItems();
  }

  Future<void> _loadItems() async {
    setState(() => _isLoading = true);
    try {
      final newItems = await widget.fetchItems(_query, _currentPage);
      setState(() {
        if (_currentPage == 0) {
          _items = newItems;
        } else {
          _items.addAll(newItems);
        }
        _isLoading = false;
        _isNextPageLoading = false;
      });
    } catch (error) {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _loadNextPage() async {
    if (_isNextPageLoading) return;
    setState(() {
      _isNextPageLoading = true;
      _currentPage++;
    });
    await _loadItems();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.searchHint,
              style: Styles.labelText,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: _searchController,
            decoration: const InputDecoration(
              hintText: 'Digite para buscar.',
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),
        Expanded(
          child: _isLoading
              ? const Center(child: CircularProgressIndicator())
              : SizedBox(
                  height: 200,
                  child: NotificationListener<ScrollNotification>(
                    onNotification: (notification) {
                      if (notification is ScrollEndNotification && notification.metrics.pixels == notification.metrics.maxScrollExtent) {
                        _loadNextPage();
                      }
                      return false;
                    },
                    child: ListView.builder(
                      itemCount: _items.length + 1,
                      itemBuilder: (context, index) {
                        if (index == _items.length) {
                          if (_isLoading) {
                            return const Center(child: CircularProgressIndicator());
                          } else {
                            return const SizedBox.shrink();
                          }
                        }

                        return ListTile(
                          title: Text(_items[index]),
                          onTap: () {
                            widget.onItemSelected(_items[index]);
                            Navigator.pop(context, _items[index]);
                          },
                        );
                      },
                    ),
                  ),
                ),
        ),
        Text(
          'Role para baixo para carregar mais',
          style: Styles.textDetailsTitle
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: TextButton(
            onPressed:()=> Get.back(),
            child: const Text('Fechar'),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
