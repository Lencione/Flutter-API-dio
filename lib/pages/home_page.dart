import 'package:flutter/material.dart';
import 'package:splashscreen/controllers/home_controller.dart';
import 'package:splashscreen/models/post_model.dart';
import 'package:splashscreen/repositories/home_repository_imp.dart';
import 'package:splashscreen/services/prefs_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _controller = HomeController(HomeRepositoryImp());
  @override
  void initState() {
    super.initState();
    _controller.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consumo de API'),
        backgroundColor: Colors.green[200],
        actions: [
          IconButton(
            onPressed: () {
              PrefsService.logout();
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/login', (_) => true);
            },
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: ValueListenableBuilder<List<PostModel>>(
        valueListenable: _controller.posts,
        builder: (_, list, __) {
          return ListView.separated(
            shrinkWrap: true,
            itemCount: list.length,
            itemBuilder: (_, index) => ListTile(
              leading: Text(list[index].id.toString()),
              title: Text(list[index].title),
              trailing: const Icon(Icons.arrow_forward),
              onTap: (() {
                Navigator.of(context).pushNamed(
                  '/details',
                  arguments: list[index],
                );
              }),
            ),
            separatorBuilder: (_, __) => const Divider(),
          );
        },
      ),
    );
  }
}
