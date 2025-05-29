import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shortid/shortid.dart';
import 'package:ticketing_app/controllers/base_controller.dart';
import 'package:ticketing_app/controllers/main_controller.dart';
import 'package:ticketing_app/models/ticket_model.dart';

class AddTicketController extends BaseController {
  final TextEditingController descriptionController = TextEditingController();
  final selectedPriority = TicketPriority.low.obs;

  void addTicket(String description, TicketPriority priority) {
    if (descriptionController.text.trim().isEmpty) {
      showSnackBar('Description cannot be empty');
      return;
    }
    Get.find<MainController>().addNewTicket(
      TicketModel(id: shortid.generate(), description: description, priority: priority, date_opened: DateTime.now()),
    );
  }
}
