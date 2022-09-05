import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';

showPickerDateRange(
  BuildContext context,
  Function(DateTime?) startDate,
  Function(DateTime?) endDate,
  Function(String) errorMsg,
) {
  print("CancelText: ${PickerLocalizations.of(context).cancelText}");

  Picker startPicker = Picker(
    hideHeader: true,
    adapter: DateTimePickerAdapter(
      type: PickerDateTimeType.kYMD,
      maxValue: DateTime.now(),
    ),
    onConfirm: (Picker picker, List value) =>
        startDate((picker.adapter as DateTimePickerAdapter).value),
  );

  Picker endPicker = Picker(
    hideHeader: true,
    adapter: DateTimePickerAdapter(
      type: PickerDateTimeType.kYMD,
      maxValue: DateTime.now(),
    ),
    onConfirm: (Picker picker, List value) =>
        endDate((picker.adapter as DateTimePickerAdapter).value),
  );

  List<Widget> actions = [
    ElevatedButton(
      child: Text('Cancel'),
      onPressed: () => Navigator.pop(context),
    ),
    ElevatedButton(
      child: Text('Confirm'),
      onPressed: () {
        Navigator.pop(context);

        if ((startPicker.adapter as DateTimePickerAdapter).value!.isBefore(
              (endPicker.adapter as DateTimePickerAdapter).value ??
                  DateTime.now(),
              // DateTime.now() is only used to remove the null safety error
            )) {
          startPicker.onConfirm!(startPicker, startPicker.selecteds);
          endPicker.onConfirm!(endPicker, endPicker.selecteds);
        } else
          errorMsg('Beginning Date can\'t be greater than Ending Date.');
      },
    )
  ];

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Select Date Range"),
        actions: actions,
        content: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Begin:",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
              startPicker.makePicker(),
              SizedBox(height: 6),
              Text(
                "End:",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
              endPicker.makePicker(ThemeData.dark())
            ],
          ),
        ),
      );
    },
  );
}
