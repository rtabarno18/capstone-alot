import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import '../../models/meeting.dart';

@RoutePage()
class BarberHomeScreen extends StatefulWidget {
  const BarberHomeScreen({super.key});

  @override
  State<BarberHomeScreen> createState() => _BarberHomeScreenState();
}

class _BarberHomeScreenState extends State<BarberHomeScreen> {
  CalendarView _calendarView = CalendarView.month;

  List<Meeting> _getDataSource() {
    final List<Meeting> meetings = <Meeting>[];
    final DateTime today = DateTime.now();
    final DateTime startTime =
        DateTime(today.year, today.month, today.day, 9, 0, 0);
    final DateTime endTime = startTime.add(const Duration(hours: 2));
    meetings.add(Meeting(
      'Meeting',
      startTime,
      endTime,
      const Color(0xFF0F8644),
      false,
    ));
    return meetings;
  }

  List<DateTime> _getBlackoutDates() {
    final List<DateTime> blackoutDates = <DateTime>[];
    final DateTime today = DateTime.now();
    blackoutDates.add(DateTime(today.year, today.month, today.day + 1));
    blackoutDates.add(DateTime(today.year, today.month, today.day + 3));
    return blackoutDates;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello, Barber!'),
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9, // 90% of screen width
          height:
              MediaQuery.of(context).size.height * 0.85, // 85% of screen height
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Stack(
            children: [
              SfCalendar(
                view: _calendarView,
                dataSource: MeetingDataSource(_getDataSource()),
                blackoutDates: _getBlackoutDates(),
                blackoutDatesTextStyle: const TextStyle(
                  color: Colors.red,
                  decoration: TextDecoration.lineThrough,
                ),
                monthViewSettings: const MonthViewSettings(
                  appointmentDisplayMode:
                      MonthAppointmentDisplayMode.appointment,
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: DropdownButton<CalendarView>(
                  value: _calendarView,
                  icon: const Icon(Icons.arrow_downward,
                      color: Color(0xFF6440FE)),
                  dropdownColor: Colors.white,
                  underline: Container(
                    height: 2,
                    color: Colors.white,
                  ),
                  onChanged: (CalendarView? newValue) {
                    setState(() {
                      _calendarView = newValue!;
                    });
                  },
                  items: CalendarView.values
                      .map<DropdownMenuItem<CalendarView>>(
                          (CalendarView value) {
                    return DropdownMenuItem<CalendarView>(
                      value: value,
                      child: Container(), // Empty container to hide the text
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}
