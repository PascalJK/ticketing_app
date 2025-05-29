import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticketing_app/controllers/add_ticket_controller.dart';
import 'package:ticketing_app/controllers/main_controller.dart';
import 'package:ticketing_app/models/ticket_model.dart';
import 'package:ticketing_app/pages/widgets/add_ticket_bottom_sheet.dart';
import 'package:ticketing_app/pages/widgets/drop_down_widget.dart';

class HomePage extends GetView<MainController> {
  const HomePage({super.key});

  Future<void> showAddTicketBottomSheet(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => AddTicketBottomSheet(),
    ).then((value) => Get.delete<AddTicketController>());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Client Ticket App')),
      floatingActionButton: FloatingActionButton(onPressed: () => showAddTicketBottomSheet(context), child: Icon(Icons.add)),
      body: GetBuilder<MainController>(
        builder: (c) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 5, 0),
                child: Row(children: [Expanded(child: Text('Tickets', style: context.textTheme.titleLarge)), DropDownWidget()]),
              ),
              Expanded(
                child:
                    c.getTickets.isNotEmpty
                        ? ListView.separated(
                          separatorBuilder: (context, index) => Divider(),
                          itemCount: c.getTickets.length,
                          padding: EdgeInsets.symmetric(vertical: 15),
                          itemBuilder: (context, index) {
                            return TicketCard(model: c.getTickets[index]);
                          },
                        )
                        : Center(child: Text('No Tickets Added')),
              ),
            ],
          );
        },
      ),
    );
  }
}

class TicketCard extends StatelessWidget {
  const TicketCard({super.key, required this.model});

  final TicketModel model;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Ticket id: ${model.id}', style: context.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold)),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('"${model.description}"', style: context.textTheme.bodyMedium?.copyWith(fontSize: 13)),
          Text('Ticket Priority: ${model.priority.name.capitalizeFirst}'),
          SizedBox(height: 5),
          Row(
            children: [
              Icon(Icons.calendar_today, size: 15),
              SizedBox(width: 5),
              Text('Date Opened: ${model.getDateOpened}', style: context.textTheme.bodySmall),
            ],
          ),
        ],
      ),
      trailing: model.is_closed ? Icon(Icons.check_box) : Icon(Icons.check_box_outline_blank),
      onTap: () {
        Get.find<MainController>().updateTicketState(model);
      },
    );
  }
}
