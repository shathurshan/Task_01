import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  final List<String?> data;
  DropDown(this.data);

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  @override
  Widget build(BuildContext context) {
    String? selectedName = widget.data[0];
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            width: 2,
            color: Colors.blue,
          ),
        ),
      ),
      value: selectedName,
      items: widget.data.map((supplier_name) {
        String supName = supplier_name!;
        return DropdownMenuItem<String>(
          value: supplier_name,
          child: Text(supName),
        );
      }).toList(),
      onChanged: (supplier_name) => setState(() {
        selectedName = supplier_name;
      }),
    );
  }
}
