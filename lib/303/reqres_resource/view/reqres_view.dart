import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_full_learn/101/image_learn.dart';
import 'package:flutter_full_learn/202/image_learn_202.dart';
import 'package:flutter_full_learn/303/reqres_resource/model/resource_model.dart';
import 'package:flutter_full_learn/303/reqres_resource/service/reqres_service.dart';
import 'package:flutter_full_learn/303/reqres_resource/viewModel/req_res_privider.dart';
import 'package:flutter_full_learn/product/extension/string_extension.dart';
import 'package:flutter_full_learn/product/global/rescource_context.dart';
import 'package:flutter_full_learn/product/global/theme_notifier.dart';
import 'package:flutter_full_learn/product/service/project_dio.dart';
import 'package:provider/provider.dart';

class ReqResView extends StatefulWidget {
  const ReqResView({super.key});

  @override
  State<ReqResView> createState() => _ReqResViewState();
}

// class _ReqResViewState extends ReqresViewModel {
class _ReqResViewState extends State<ReqResView> with ProjectDioMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ReqResProvider>(
      create: (context) => ReqResProvider(ReqresService(service)),
      builder: (context, child) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              context.read<ThemeNotifier>().changeTheme();
            },
            child: const Icon(Icons.add),
          ),
          appBar: AppBar(
              actions: const [_SaveAndNavigate()],
              title: context.watch<ReqResProvider>().isLoading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : null),
          body: Column(
            children: [
              const _TempPlaceHolder(),
              Expanded(child: _recourceListView(context, context.watch<ReqResProvider>().resources)),
            ],
          ),
        );
      },
    );
  }

  ListView _recourceListView(BuildContext context, List<Data> items) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
            color: Color(items[index].color?.colorValue ?? 0),
            child: Text(
              items[index].name ?? '',
              style: const TextStyle(fontSize: 25),
            ));
      },
    );
  }
}

class _SaveAndNavigate extends StatelessWidget {
  const _SaveAndNavigate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 40),
      child: Row(
        children: [
          IconButton(
              onPressed: () {
                context.read<ReqResProvider>().saveToLocale(context.read<ResourceContext>());
                Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                  return const ImageLearn202();
                }));
              },
              icon: const Icon(Icons.ac_unit)),
          IconButton(
            onPressed: () {
              context.read<ReqResProvider>().saveToLocale(context.read<ResourceContext>());
              Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                return const ImageLearn202();
              }));
            },
            icon: Badge.count(
              count: 986,
              child: const Icon(Icons.notifications),
            ),
          ),
          IconButton(
            onPressed: () {
              context.read<ReqResProvider>().saveToLocale(context.read<ResourceContext>());
              Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                return const ImageLearn202();
              }));
            },
            icon: const Badge(
                label: Text('Offline'),
                backgroundColor: Colors.orangeAccent,
                textColor: Colors.black87,
                child: Icon(Icons.wifi)),
          )
        ],
      ),
    );
  }
}

class _TempPlaceHolder extends StatelessWidget {
  const _TempPlaceHolder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Selector<ReqResProvider, bool>(builder: (context, value, child) {
      return value ? const Placeholder() : const Text('data');
    }, selector: (context, provider) {
      return provider.isLoading;
    });
  }
}
