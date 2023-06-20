import 'package:flutter/material.dart';
import 'package:provider_state_management_flutter_app/feature/constants/strings.dart';
import 'package:provider_state_management_flutter_app/product/navigator.dart';
import 'package:provider_state_management_flutter_app/product/screens/counter_screen.dart';
import 'package:provider_state_management_flutter_app/product/screens/fetch_network_data_screen.dart';

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
          onPressed: () => Navigation().navigateToDestination(context, const CounterScreen()),
          child: const Text(Strings.counterScreenTitle),
        ),
        ElevatedButton(
          onPressed: () => Navigation().navigateToDestination(context, const FetchNetworkDataScreen()),
          child: const Text(Strings.fetchNetworkDataScreenTitle),
        )
      ],
    );
  }
}
