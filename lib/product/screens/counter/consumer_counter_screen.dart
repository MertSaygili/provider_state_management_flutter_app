import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/consumer_counter_provider.dart';

class ConsumeerCounterScreen extends StatelessWidget {
  const ConsumeerCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ConsumerCounterProvider(),
      child: Consumer<ConsumerCounterProvider>(
        builder: (context, counterProvider, child) => _buildScaffold(counterProvider, context),
      ),
    );
  }

  Scaffold _buildScaffold(ConsumerCounterProvider counterProvider, BuildContext context) {
    return Scaffold(
      body: Center(child: Text(counterProvider.counter.toString())),
      floatingActionButton: _floatingIncrementButton(context, counterProvider),
    );
  }

  FloatingActionButton _floatingIncrementButton(BuildContext context, ConsumerCounterProvider counterProvider) {
    return FloatingActionButton(onPressed: counterProvider.increment, child: const Icon(Icons.add));
  }
}
