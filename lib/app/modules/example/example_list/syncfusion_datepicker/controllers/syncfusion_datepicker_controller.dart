// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class SyncfusionDatepickerController extends GetxController {
  final DateRangePickerController dateRangePickerController =
      DateRangePickerController();
  final end = ''.obs;
  final start = ''.obs;
  getDatePicker({required DateRangePickerSelectionMode mode}) {
    Get.dialog(
      SimpleDialog(
        children: [
          SfDateRangePicker(
            extendableRangeSelectionDirection:
                ExtendableRangeSelectionDirection.both,
            enablePastDates: true,
            minDate: DateTime.now(),
            maxDate: DateTime.now().add(const Duration(days: 200)),
            allowViewNavigation: true,
            showActionButtons: true,
            selectionMode: mode,
            controller: dateRangePickerController,
            showTodayButton: false,
            onCancel: () {
              print('click datePicker Cancel');
              Get.back();
            },
            onSubmit: (Object? value) {
              print(value);
              if (value is PickerDateRange) {
                final DateTime rangeStartDate = value.startDate!;
                start.value = rangeStartDate.toString().split(' ')[0];
                print(rangeStartDate);
                print(start);
                final DateTime? rangeEndDate = value.endDate;
                end.value = rangeEndDate.toString() == 'null'
                    ? ''
                    : rangeEndDate.toString().split(' ')[0];
                print(rangeEndDate);
              } else if (value is DateTime) {
                final DateTime selectedDate = value;
                start.value = selectedDate.toString().split(' ')[0];
                print(selectedDate);
              }
              Get.back();
            },
            monthViewSettings: const DateRangePickerMonthViewSettings(
                enableSwipeSelection: true,
                showTrailingAndLeadingDates: true,
                showWeekNumber: false),
          ),
        ],
      ),
    );
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
