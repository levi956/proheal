import 'package:flutter/material.dart';
import 'package:proheal/app/models/schedule.dart';
import 'package:proheal/app/pages/appointment/schedule.dart';
import 'package:proheal/app/services/database/read.dart';
import 'package:proheal/core/navigation/navigation.dart';
import 'package:proheal/core/widgets/appointment_card.dart';
import 'package:proheal/core/widgets/custom_button.dart';

class Appointments extends StatefulWidget {
  const Appointments({Key? key}) : super(key: key);

  @override
  State<Appointments> createState() => _AppointmentsState();
}

class _AppointmentsState extends State<Appointments> {
  late Stream<List<ScheduleModel>> appointmentStream;

  @override
  void initState() {
    appointmentStream = DatabaseRead.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 60, bottom: 20),
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
          StreamBuilder<List<ScheduleModel>>(
            stream: appointmentStream,
            builder: (_, snapshot) {
              if (snapshot.hasData) {
                List<ScheduleModel> appointments = snapshot.data!;

                return SizedBox(
                  height: size * 0.6,
                  child: ListView.separated(
                    itemCount: appointments.length,
                    itemBuilder: (_, index) {
                      return AppointmentCard(
                        date: appointments[index].scheduleDate!,
                        status: appointments[index].scheduleStatus!,
                        additionalNotes: appointments[index].remarks,
                      );
                    },
                    separatorBuilder: ((context, index) =>
                        const SizedBox(height: 10)),
                  ),
                );
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
    );
  }
}
