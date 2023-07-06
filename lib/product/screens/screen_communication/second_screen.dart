import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/screen_communication_provider.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  final String _title = 'Second Screen';
  final String _sendDataToBack = 'Send Data To Back';

  @override
  Widget build(BuildContext context) {
    // final ScreenCommunicationProvider screenCommunicationProvider = Provider.of<ScreenCommunicationProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(title: Text(_title)),
      body: Center(
        child: Column(
          children: [
            Text(context.read<ScreenCommunicationProvider>().comingDataFromScreenOne),
            ElevatedButton(
              onPressed: () {
                context.read<ScreenCommunicationProvider>().setComingDataFromScreenTwo('Coming Data From Screen Two');
                Navigator.pop(context);
              },
              child: Text(_sendDataToBack),
            ),
          ],
        ),
      ),
    );
  }
}
