// ignore_for_file: avoid_print, unused_local_variable, unnecessary_new, unrelated_type_equality_checks, no_leading_underscores_for_local_identifiers, avoid_unnecessary_containers

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../controllers/syncfusion_datepicker_controller.dart';

class SyncfusionDatepickerView extends GetView<SyncfusionDatepickerController> {
  const SyncfusionDatepickerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SyncfusionDatepickerView'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _getBooking(),
          ],
        ),
      ),
    );
  }

  Widget _getBooking() {
    RxInt _value = 1.obs;
    return Container(
        // elevation: 10,
        margin: const EdgeInsets.all(30),
        child: Container(
            // color: model.cardThemeColor,
            child: Column(children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: const Text(
              'Book a Flight',
              style: TextStyle(
                  // color: model.textColor,
                  backgroundColor: Colors.transparent,
                  fontWeight: FontWeight.w600,
                  fontSize: 20),
            ),
          ),
          Container(
              padding: EdgeInsets.zero,
              child: Row(children: <Widget>[
                Expanded(
                  flex: 5,
                  child: RawMaterialButton(
                      padding: const EdgeInsets.fromLTRB(5, 5, 10, 5),
                      onPressed: () {
                        _value.value = 0;
                      },
                      child: Row(
                        children: <Widget>[
                          Obx(() => Icon(
                                _value.value == 0
                                    ? Icons.radio_button_checked
                                    : Icons.radio_button_unchecked,
                                // color: Get.theme.backgroundColor,
                                size: 22,
                              )),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            'One-way',
                            style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: _value.value == 0
                                    ? FontWeight.w600
                                    : FontWeight.w400),
                          ),
                        ],
                      )),
                ),
                Expanded(
                    flex: 5,
                    child: RawMaterialButton(
                      onPressed: () {
                        _value.value = 1;
                      },
                      padding: const EdgeInsets.fromLTRB(5, 5, 10, 5),
                      child: Row(
                        children: <Widget>[
                          Obx(
                            () => Icon(
                              _value.value == 1
                                  ? Icons.radio_button_checked
                                  : Icons.radio_button_unchecked,
                              // color: model.backgroundColor,
                              size: 22,
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Round-Trip',
                            style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: _value.value == 1
                                    ? FontWeight.w600
                                    : FontWeight.w400),
                          ),
                        ],
                      ),
                    )),
              ])),
          Row(children: <Widget>[
            Expanded(
                flex: 5,
                child: Container(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const <Widget>[
                        Text(
                          'From',
                          style: TextStyle(color: Colors.grey, fontSize: 10),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 5, 5, 0),
                          child: Text('Cleveland (CLE)',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500)),
                        ),
                      ],
                    ))),
            Expanded(
                flex: 5,
                child: Container(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const <Widget>[
                        Text(
                          'Destination',
                          style: TextStyle(color: Colors.grey, fontSize: 10),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 5, 5, 0),
                          child: Text('Chicago (CHI)',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500)),
                        ),
                      ],
                    )))
          ]),
          const Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Divider(
                color: Colors.black26,
                height: 1.0,
                thickness: 1,
              )),
          Row(children: [
            Expanded(
              flex: 5,
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => controller.getDatePicker(
                    mode: _value == 0
                        ? DateRangePickerSelectionMode.single
                        : DateRangePickerSelectionMode.extendableRange),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Departure Date',
                          style: TextStyle(color: Colors.grey, fontSize: 10)),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 5, 5, 0),
                        child: Obx(
                          () => Text(controller.start.value),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => controller.getDatePicker(
                    mode: _value == 0
                        ? DateRangePickerSelectionMode.single
                        : DateRangePickerSelectionMode.extendableRange),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Return Date',
                          style: TextStyle(color: Colors.grey, fontSize: 10)),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 5, 5, 0),
                        child: Obx(
                          (() => _value.value == 0
                              ? const Text('')
                              : Text(controller.end.value)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ]),
          const Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Divider(
                color: Colors.black26,
                height: 1.0,
                thickness: 1,
              )),
          Row(children: <Widget>[
            Expanded(
                flex: 5,
                child: Container(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const <Widget>[
                        Text(
                          'Travellers',
                          style: TextStyle(color: Colors.grey, fontSize: 10),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 5, 5, 0),
                          child: Text('1 Adult',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500)),
                        ),
                      ],
                    ))),
            Expanded(
                flex: 5,
                child: Container(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const <Widget>[
                        Text(
                          'Class',
                          style: TextStyle(color: Colors.grey, fontSize: 10),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 5, 5, 0),
                          child: Text('Economy',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500)),
                        ),
                      ],
                    )))
          ]),
          Container(
              margin: const EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  RawMaterialButton(
                    // fillColor: model.backgroundColor,
                    splashColor: Colors.grey.withOpacity(0.12),
                    hoverColor: Colors.grey.withOpacity(0.04),
                    onPressed: () {
                      ScaffoldMessenger.of(Get.context!)
                          .showSnackBar(const SnackBar(
                        content: Text(
                          'Searching...',
                        ),
                        duration: Duration(milliseconds: 200),
                      ));
                    },
                    child: const Text(
                      'SEARCH',
                      style: TextStyle(
                          color: Colors.black,
                          backgroundColor: Colors.transparent,
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    ),
                  ),
                ],
              )),
        ])));
  }
}
