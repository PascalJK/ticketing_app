import 'package:get/get.dart';
import 'package:ticketing_app/controllers/base_controller.dart';
import 'package:ticketing_app/models/ticket_model.dart';

const String ageNewestToOldest = "Age (Newest -> Oldest)";
const String ageOldestToNewest = "Age (Oldest -> Newest)";
const String priorityHighToLow = "Priority (High -> Low)";
const String priorityLowToHigh = "Priority (Low -> High)";

class MainController extends BaseController {
  final List<TicketModel> _tickets = [];
  List<TicketModel> get getTickets => _tickets;

  static List<String> get sortOption => [priorityHighToLow, priorityLowToHigh, ageNewestToOldest, ageOldestToNewest];
  static final List<String> ticketPriorityOptions = ['High', 'Medium', 'Low'];
  static final List<int> sortOptionIndex = [0, 1, 2, 3];

  int selectedSortOptionIndex = 0;

  void addNewTicket(TicketModel ticket) {
    _tickets.add(ticket);
    Get.back();
    showSnackBar('Ticket: ${ticket.id} added successfully');
    update();
  }

  void updateTicketState(TicketModel ticket) {
    var index = _tickets.indexWhere((t) => t.id == ticket.id);
    _tickets[index] = ticket.copyWith(is_closed: !ticket.is_closed);
    showSnackBar('Ticket: ${ticket.id} marked as ${!ticket.is_closed ? 'closed' : 'open'}');
    update();
  }

  void sortListBy(int? filter) {
    if (filter == null) return;
    if (filter == selectedSortOptionIndex) return;
    selectedSortOptionIndex = filter;
    _tickets.sort((a, b) {
      switch (sortOption[selectedSortOptionIndex]) {
        case priorityHighToLow:
          return _priorityValue(b.priority).compareTo(_priorityValue(a.priority));
        case priorityLowToHigh:
          return _priorityValue(a.priority).compareTo(_priorityValue(b.priority));
        case ageNewestToOldest:
          return b.date_opened.compareTo(a.date_opened);
        // return b.getAgeDays.compareTo(a.getAgeDays);
        case ageOldestToNewest:
          return a.date_opened.compareTo(b.date_opened);
        // return a.getAgeDays.compareTo(b.getAgeDays);
        default:
          return 0;
      }
    });
    update();
  }

  int _priorityValue(TicketPriority priority) {
    switch (priority) {
      case TicketPriority.high:
        return 3;
      case TicketPriority.medium:
        return 2;
      case TicketPriority.low:
        return 1;
    }
  }
}
