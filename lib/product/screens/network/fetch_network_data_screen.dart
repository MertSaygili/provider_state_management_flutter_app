import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../feature/constants/strings.dart';
import '../../../feature/log/log_manager.dart';
import '../../navigator.dart';
import '../../providers/fetch_data_provider.dart';
import 'fetch_network_detailed_data.dart';

class FetchNetworkDataScreen extends StatefulWidget {
  const FetchNetworkDataScreen({super.key});

  @override
  State<FetchNetworkDataScreen> createState() => _FetchNetworkDataScreenState();
}

class _FetchNetworkDataScreenState extends State<FetchNetworkDataScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<FetchDataProvider>().fetchAllProducts();
    });

    LogManager.logger.d('FetchNetworkDataScreen._LoadingPageState.initState()');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(Strings.fetchNetworkDataScreenTitle), centerTitle: true, automaticallyImplyLeading: true),
      body: context.watch<FetchDataProvider>().isLoading ? const _LoadingPage() : const _LoadedPage(),
    );
  }
}

class _LoadingPage extends StatelessWidget {
  const _LoadingPage();

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}

class _LoadedPage extends StatelessWidget {
  const _LoadedPage();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListView.builder(
        itemCount: context.watch<FetchDataProvider>().products.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () => NavigatorManager().navigateToDestination(
            context,
            FetchNetworkDetailedDataScreen(productId: context.read<FetchDataProvider>().products[index].id.toString()),
          ),
          child: ListTile(
            title: Text(context.watch<FetchDataProvider>().products[index].title.toString()),
            subtitle: Text(context.watch<FetchDataProvider>().products[index].price.toString()),
          ),
        ),
      ),
    );
  }
}
