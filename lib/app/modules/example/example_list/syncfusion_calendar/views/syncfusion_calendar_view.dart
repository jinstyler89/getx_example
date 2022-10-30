import 'dart:math';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:syncfusion_flutter_core/core.dart';

///isSameDate

import '../controllers/syncfusion_calendar_controller.dart';

class SyncfusionCalendarView extends GetView<SyncfusionCalendarController> {
  const SyncfusionCalendarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('SyncfusionCalendarView'),
          centerTitle: true,
        ),
        body: SfCalendar(
          monthCellBuilder: _monthCellBuilder,

          view: CalendarView.month,
          minDate: DateTime.now(),
          maxDate: DateTime.now().add(const Duration(days: 20)),
          showDatePickerButton: true,
          // dataSource: MeetingDataSource(_getDataSource()),
          // monthViewSettings: MonthViewSettings(
          //     appointmentDisplayMode: MonthAppointmentDisplayMode.appointment),
        ));
  }

  Widget _monthCellBuilder(
      BuildContext buildContext, MonthCellDetails details) {
    // final bool isToday = isSameDate(details.date, DateTime.now());

    return Container(
      // color: Colors.green,
      decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(width: 0.1, color: Colors.black),
            left: BorderSide(width: 0.1, color: Colors.black),
            bottom: BorderSide(width: 0.1, color: Colors.black),
            right: BorderSide(width: 0.1, color: Colors.black),
          ),
          color: Colors.yellow),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            color: Colors.red,
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  details.date.day.toString(),
                  style: const TextStyle(
                      fontSize: 12, overflow: TextOverflow.ellipsis),
                ),
                const Text(
                  'Best',
                  style:
                      TextStyle(fontSize: 10, overflow: TextOverflow.ellipsis),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.yellow,
            child: const Text(
              '100',
              style: TextStyle(fontSize: 12, overflow: TextOverflow.ellipsis),
            ),
          ),
          Container(
            color: Colors.pink,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Transform.rotate(
                  angle: pi / 4,
                  child: Text(
                    String.fromCharCode(Icons.airplanemode_active.codePoint),
                    style: TextStyle(
                        color: Colors.green,
                        fontFamily: Icons.airplanemode_active.fontFamily,
                        fontSize: 14),
                    // textAlign: TextAlign.center,
                  ),
                ),
                const Text(
                  '国航',
                  style: TextStyle(fontSize: 10),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
//   List<Meeting> _getDataSource() {
//     final List<Meeting> meetings = <Meeting>[];
//     final DateTime today = DateTime.now();
//     final DateTime startTime =
//         DateTime(today.year, today.month, today.day, 9, 0, 0);
//     final DateTime endTime = startTime.add(const Duration(hours: 2));
//     meetings.add(Meeting(
//         'Conference', startTime, endTime, const Color(0xFF0F8644), false));
//     return meetings;
//   }
// }

// class MeetingDataSource extends CalendarDataSource {
//   MeetingDataSource(List<Meeting> source) {
//     appointments = source;
//   }

//   @override
//   DateTime getStartTime(int index) {
//     return appointments![index].from;
//   }

//   @override
//   DateTime getEndTime(int index) {
//     return appointments![index].to;
//   }

//   @override
//   String getSubject(int index) {
//     return appointments![index].eventName;
//   }

//   @override
//   Color getColor(int index) {
//     return appointments![index].background;
//   }

//   @override
//   bool isAllDay(int index) {
//     return appointments![index].isAllDay;
//   }
// }

// class Meeting {
//   Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

//   String eventName;
//   DateTime from;
//   DateTime to;
//   Color background;
//   bool isAllDay;
// }
