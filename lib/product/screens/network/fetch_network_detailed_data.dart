import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/fetch_data_provider.dart';

class FetchNetworkDetailedDataScreen extends StatefulWidget {
  const FetchNetworkDetailedDataScreen({super.key, required this.productId});

  final String productId;

  @override
  State<FetchNetworkDetailedDataScreen> createState() => _FetchNetworkDetailedDataScreenState();
}

class _FetchNetworkDetailedDataScreenState extends State<FetchNetworkDetailedDataScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<FetchDataProvider>().fetchProductById(int.parse(widget.productId));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return context.watch<FetchDataProvider>().isLoading ? const _LoadingScreen() : const _LoadedScreen();
  }
}

class _LoadingScreen extends StatelessWidget {
  const _LoadingScreen();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}

class _LoadedScreen extends StatelessWidget {
  const _LoadedScreen();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.read<FetchDataProvider>().singleProduct.first.title.toString()),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: Card(
        child: ListTile(
          dense: true,
          leading: Image.network(context.read<FetchDataProvider>().singleProduct.first.images?.last.toString() ?? '', fit: BoxFit.cover),
          subtitle: Text(context.read<FetchDataProvider>().singleProduct.first.description.toString()),
        ),
      ),
    );
  }
}
