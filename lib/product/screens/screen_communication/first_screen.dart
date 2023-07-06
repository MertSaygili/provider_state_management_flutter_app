import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/screen_communication_provider.dart';
import 'second_screen.dart';

import '../../navigator.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final String _title = 'First Screen';

  final String _goToSecondScreen = 'Go to Second Screen';

  @override
  Widget build(BuildContext context) {
    // final ScreenCommunicationProvider screenCommunicationProvider = Provider.of<ScreenCommunicationProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(title: Text(_title)),
      body: Center(
        child: Column(
          children: [
            Text(context.watch<ScreenCommunicationProvider>().comingDataFromScreenTwoToOne),
            ElevatedButton(
              onPressed: () {
                context.read<ScreenCommunicationProvider>().setComingDataFromScreenOne('Coming Data From Screen One');
                NavigatorManager().navigateToDestination(context, const SecondScreen());
              },
              child: Text(_goToSecondScreen),
            ),
          ],
        ),
      ),
    );
  }
}
