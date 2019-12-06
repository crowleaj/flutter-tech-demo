import 'package:flutter/material.dart';

class AppointmentsScreen extends StatefulWidget {
  AppointmentsScreen({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AppointmentsScreen();
  }
}

class _AppointmentsScreen extends State<AppointmentsScreen> {
  List<String> appointments = ["Checkup", "EKG", "Ultrasound"];
  final TextEditingController appointmentController = TextEditingController();
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
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext bc) {
          return Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: Container(
                child: new Wrap(
                  children: <Widget>[
                    DecoratedTextField(appointmentController),
                    Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: Align(
                            alignment: Alignment.center,
                            child: RaisedButton(
                              child: new Text('Add'),
                              color: Colors.blue,
                              onPressed: () {
                                setState(() {
                                  appointments.add(appointmentController.text);
                                });
                                Navigator.pop(context);
                              },
                            ))),
                  ],
                ),
              ));
        });
  }
}

class DecoratedTextField extends StatelessWidget {
  TextEditingController appointmentController;

  DecoratedTextField(TextEditingController appointmentController) {
    this.appointmentController = appointmentController;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
            color: Colors.grey[300], borderRadius: BorderRadius.circular(10)),
        child: TextField(
          controller: appointmentController,
          decoration: InputDecoration.collapsed(
            hintText: 'Enter the appointment name',
          ),
        ));
  }
}
