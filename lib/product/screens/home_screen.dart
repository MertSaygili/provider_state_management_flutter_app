import 'package:flutter/material.dart';
import 'package:provider_state_management_flutter_app/product/screens/counter/consumer_counter_screen.dart';

import '../../feature/constants/strings.dart';
import '../navigator.dart';
import 'counter/counter_screen.dart';
import 'network/fetch_network_data_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(Strings.homeScreenTitle), centerTitle: true, automaticallyImplyLeading: true),
      body: const Center(child: _PageColumn()),
    );
  }
}

class _PageColumn extends StatelessWidget {
  const _PageColumn();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () => NavigatorManager().navigateToDestination(context, const CounterScreen()),
          child: const Text(Strings.counterScreenTitle),
        ),
        ElevatedButton(
          onPressed: () => NavigatorManager().navigateToDestination(context, const FetchNetworkDataScreen()),
          child: const Text(Strings.fetchNetworkDataScreenTitle),
        ),
        ElevatedButton(
          onPressed: () => NavigatorManager().navigateToDestination(context, const ConsumeerCounterScreen()),
          child: const Text(Strings.consumerIncrementScreenTitle),
        ),
      ],
    );
  }
}
