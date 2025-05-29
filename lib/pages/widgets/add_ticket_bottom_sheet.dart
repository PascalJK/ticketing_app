import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticketing_app/controllers/add_ticket_controller.dart';
import 'package:ticketing_app/models/ticket_model.dart';

class AddTicketBottomSheet extends GetView<AddTicketController> {
  AddTicketBottomSheet({super.key});

  @override
  final controller = Get.put(AddTicketController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Add New Ticket', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          TextField(
            controller: controller.descriptionController,
            decoration: const InputDecoration(labelText: 'Description', border: OutlineInputBorder()),
            minLines: 1,
            maxLines: 3,
          ),
          const SizedBox(height: 16),
          const Text('Ticket Priority', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          Obx(
            () => Column(
              children:
                  TicketPriority.values.map((priority) {
                    return RadioListTile<TicketPriority>(
                      title: Text(priority.name.capitalizeFirst!),
                      value: priority,
                      groupValue: controller.selectedPriority.value,
                      onChanged: (value) {
                        if (value != null) controller.selectedPriority.value = value;
                      },
                    );
                  }).toList(),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                controller.addTicket(controller.descriptionController.text.trim(), controller.selectedPriority.value);
              },
              child: const Text('Add Ticket'),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
        ],
      ),
    );
  }
}
