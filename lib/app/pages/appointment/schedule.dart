import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:proheal/app/models/schedule.dart';
import 'package:proheal/core/repository/repostiory.dart';
import 'package:proheal/core/widgets/custom_button.dart';

import '../../../core/navigation/navigation.dart';
import '../../../core/style/color_contants.dart';
import '../../services/http_service/response_model.dart';

class ScheduleAppointment extends StatefulWidget {
  const ScheduleAppointment({Key? key}) : super(key: key);

  @override
  State<ScheduleAppointment> createState() => _ScheduleAppointmentState();
}

class _ScheduleAppointmentState extends State<ScheduleAppointment> {
  DateTime userScheduled = DateTime.now();
  String _additionalNotes = '';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 10,
            bottom: 10,
          ),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    iconSize: 19,
                    color: black,
                    onPressed: () => pop(context),
                    icon: const Icon(Icons.arrow_back),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'Fill the details below to schedule an appointment',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 20),
                  DateTimePicker(
                    type: DateTimePickerType.dateTimeSeparate,
                    dateMask: 'd MMM, yyyy',
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                    icon: const Icon(LineAwesomeIcons.calendar_1),
                    dateLabelText: 'Date',
                    timeLabelText: "Hour",
                    onChanged: (val) {
                      setState(() {
                        userScheduled = DateTime.parse(val);
                      });
                      print(userScheduled);
                    },
                    validator: (val) {
                      print(val);
                      return null;
                    },
                    onSaved: (val) => print(userScheduled),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Enter additional notes (optional)',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(height: 5),
                  TextField(
                    onChanged: (v) {
                      setState(() {
                        _additionalNotes = v;
                      });
                    },
                    textInputAction: TextInputAction.newline,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    cursorColor: black,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                    decoration: feedbackInputStyle(),
                  ),
                  const SizedBox(height: 120),
                  CustomButton(
                    text: 'Book',
                    validator: () {
                      return userScheduled != DateTime.now();
                    },
                    buttonTextColor: white,
                    buttonWidth: double.maxFinite,
                    // onPressed: () {},
                    onPressed: book,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration feedbackInputStyle() {
    return InputDecoration(
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: grey,
      filled: true,
      focusColor: grey,
      labelText: 'Enter additional notes',
      labelStyle: const TextStyle(fontWeight: FontWeight.w400),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: black),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: grey),
      ),
      errorBorder: OutlineInputBorder(
        gapPadding: 2,
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: black),
      ),
    );
  }

  // initialize your repository
  // method that books the appointment
  Future<void> book() async {
    // show loading indicator here
    final ServiceResponse response =
        await Repository.databaseCreate.scheduleAppointment(
      ScheduleModel(
        additonalNotes: _additionalNotes,
        patientName: 'Nifesi',
        scheduleDate: userScheduled,
        scheduleStatus: false,
      ),
    );
    // stop loading indicator
    if (response.status) {
      print(response.message);
      setState(() {});
    } else {
      print(response.message);
    }
  }
}
