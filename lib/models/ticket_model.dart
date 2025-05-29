// ignore_for_file: non_constant_identifier_names

enum TicketPriority { low, medium, high }

class TicketModel {
  final String id;
  final String description;
  final TicketPriority priority;
  final DateTime date_opened;
  final bool is_closed; // Added is field to be able to mark a ticked as closed (Bonus Challenge)

  TicketModel({
    required this.id,
    required this.description,
    required this.priority,
    required this.date_opened,
    this.is_closed = false,
  });

  int get getAgeDays => date_opened.day.toInt();

  String get getDateOpened {
    final now = DateTime.now();
    final difference = now.difference(date_opened);
    if (difference.inDays > 0) {
      return '${difference.inDays} days ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hours ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} minutes ago';
    } else {
      return 'Just now';
    }
  }

  int get ageDays => DateTime.now().difference(date_opened).inDays;

  TicketModel copyWith({bool? is_closed}) {
    return TicketModel(
      is_closed: is_closed ?? this.is_closed,
      id: id,
      description: description,
      priority: priority,
      date_opened: date_opened,
    );
  }
}
