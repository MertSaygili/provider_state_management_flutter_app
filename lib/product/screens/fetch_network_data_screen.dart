import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../feature/constants/strings.dart';
import '../providers/fetch_data_provider.dart';

class FetchNetworkDataScreen extends StatefulWidget {
  const FetchNetworkDataScreen({super.key});

  @override
  State<FetchNetworkDataScreen> createState() => _FetchNetworkDataScreenState();
}

class _FetchNetworkDataScreenState extends State<FetchNetworkDataScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<FetchDataProvider>(context, listen: false).fetchData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(Strings.fetchNetworkDataScreenTitle), centerTitle: true, automaticallyImplyLeading: true),
      body: context.watch<FetchDataProvider>().isLoading ? const Center(child: CircularProgressIndicator()) : const _LoadedPage(),
    );
  }
}

class _LoadedPage extends StatelessWidget {
  const _LoadedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListView.builder(
        itemCount: context.watch<FetchDataProvider>().products.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(context.watch<FetchDataProvider>().products[index].title.toString()),
          subtitle: Text(context.watch<FetchDataProvider>().products[index].price.toString()),
        ),
      ),
    );
  }
}
