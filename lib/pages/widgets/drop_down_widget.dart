import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticketing_app/controllers/main_controller.dart';

class DropDownWidget extends GetView<MainController> {
  const DropDownWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<int>(
        hint: Text('Sort Tickets', style: TextStyle(fontSize: 14, color: Theme.of(context).hintColor)),
        items: List.generate(MainController.sortOptionIndex.length, (index) {
          return DropdownMenuItem<int>(
            value: index,
            child: Row(
              children: [
                if (index == controller.selectedSortOptionIndex)
                  Padding(padding: const EdgeInsets.only(right: 5), child: Icon(Icons.check, size: 15)),
                Text(MainController.sortOption[index], style: const TextStyle(fontSize: 14)),
              ],
            ),
          );
        }),
        value: controller.selectedSortOptionIndex,
        onChanged: (int? value) {
          controller.sortListBy(value);
        },
      ),
    );
  }
}
