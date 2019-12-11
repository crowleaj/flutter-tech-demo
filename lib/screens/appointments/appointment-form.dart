import 'package:flutter/material.dart';
import 'package:hello_flutter/components/date-time-field.dart';
import 'package:hello_flutter/components/styled-button.dart';
import 'package:hello_flutter/entities/appointment.dart';
import 'package:hello_flutter/validation.dart';

import '../../utils.dart';

// Thanks https://flutter.dev/docs/cookbook/forms/validation
class AppointmentForm extends StatefulWidget {
  final Appointment appointment;
  Function onSubmitted;

  AppointmentForm(this.appointment, {this.onSubmitted = Utils.noop});

  @override
  State<StatefulWidget> createState() {
    return AppointmentFormState(appointment, onSubmitted);
  }
}

class AppointmentFormState extends State<AppointmentForm> {
  final Appointment appointment;
  final _formKey = GlobalKey<FormState>();
  final Function onSubmitted;

  AppointmentFormState(this.appointment, this.onSubmitted);

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Wrap(
          alignment: WrapAlignment.start,
          children: <Widget>[
            TextFormField(
              validator: Validation.hasValue,
              decoration: InputDecoration(labelText: "Name"),
              initialValue: appointment.name,
              onChanged: (value) => appointment.name = value,
            ),
            DateTimeField(appointment.start, onSelected: (date) {
              print('confirm $date');
              setState(() {
                appointment.start = date;
              });
            }),
            Align(
                alignment: Alignment.center,
                child: StyledButton(
                    text: "Submit",
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        onSubmitted();
                      }
                    }))
          ],
        ));
  }
}
