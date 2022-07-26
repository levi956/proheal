import 'package:flutter/material.dart';
import 'package:proheal/app/models/schedule.dart';
import 'package:proheal/app/pages/appointment/schedule.dart';
import 'package:proheal/app/services/database/read.dart';
import 'package:proheal/core/navigation/navigation.dart';
import 'package:proheal/core/widgets/appointment_card.dart';
import 'package:proheal/core/widgets/custom_button.dart';

import '../../services/http_service/response_model.dart';

class Appointments extends StatefulWidget {
  const Appointments({Key? key}) : super(key: key);

  @override
  State<Appointments> createState() => _AppointmentsState();
}

class _AppointmentsState extends State<Appointments> {
  late Future<ServiceResponse> appointmentData;

  @override
  void initState() {
    appointmentData = DatabaseRead.getUserAppointments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 60, bottom: 20),
      child: GestureDetector(
        onTap: () => setState(() {
          appointmentData = DatabaseRead.getUserAppointments();
        }),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Your Appointments',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 30),
            FutureBuilder<ServiceResponse>(
              future: appointmentData,
              builder: (_, snapshot) {
                if (snapshot.hasData) {
                  ServiceResponse response = snapshot.data!;

                  if (response.status) {
                    ScheduleModel appointment = response.data;

                    // return the widget that builds the widget

                    if (response.data != null) {
                      return AppointmentCard(
                        additionalNotes: appointment.remarks,
                        date: appointment.scheduleDate!,
                        status: appointment.scheduleStatus!,
                      );
                    }
                  } else {
                    return const Text(
                      'You have no appointments set!',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    );
                  }
                }

                return const CircularProgressIndicator.adaptive();
              },
            ),
            const SizedBox(height: 70),
            CustomButton(
              text: 'Schedule Appointment',
              buttonWidth: double.maxFinite,
              onPressed: () => pushTo(context, const ScheduleAppointment()),
            )
          ],
        ),
      ),
    );
  }
}
