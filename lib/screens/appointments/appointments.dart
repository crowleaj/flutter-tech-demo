import 'package:flutter/material.dart';
import 'package:hello_flutter/entities/appointment.dart';
import 'package:hello_flutter/screens/appointments/appointment-form.dart';

class AppointmentsScreen extends StatefulWidget {
  AppointmentsScreen({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AppointmentsScreen();
  }
}

class _AppointmentsScreen extends State<AppointmentsScreen> {
  List<String> appointments = ["Checkup", "EKG", "Ultrasound"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Maggie's Appointments")),
      body: ListView.builder(
        itemCount: appointments.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(child: ListTile(title: Text(appointments[index])));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _settingModalBottomSheet(context),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  _settingModalBottomSheet(context) {
    final Appointment appointment = new Appointment();
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext bc) {
          return Padding(
              padding: EdgeInsets.all(15),
              child: Padding(
                  padding: MediaQuery.of(context).viewInsets,
                  child: Container(
                    child: AppointmentForm(
                      appointment,
                      onSubmitted: () {
                        setState(() {
                          appointments.add(appointment.name);
                        });
                        Navigator.pop(context);
                      },
                    ),
                  )));
        });
  }
}
