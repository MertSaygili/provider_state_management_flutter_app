import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../feature/constants/strings.dart';
import '../providers/counter_provider.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(Strings.counterScreenTitle), centerTitle: true, automaticallyImplyLeading: true),
      body: Center(child: Text(context.watch<CounterProvider>().count.toString())),
      floatingActionButton: const _FloatinActionButtons(),
    );
  }
}

class _FloatinActionButtons extends StatelessWidget {
  const _FloatinActionButtons();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          onPressed: () => context.read<CounterProvider>().increment(),
          heroTag: Strings.addTag,
          child: const Icon(Icons.add),
        ),
        const SizedBox(width: 10),
        FloatingActionButton(
          onPressed: () => context.read<CounterProvider>().decrement(),
          heroTag: Strings.removeTag,
          child: const Icon(Icons.remove),
        ),
        const SizedBox(width: 10),
        FloatingActionButton(
          onPressed: () => context.read<CounterProvider>().reset(),
          heroTag: Strings.resetTag,
          child: const Icon(Icons.refresh),
        ),
        const SizedBox(width: 10),
      ],
    );
  }
}
