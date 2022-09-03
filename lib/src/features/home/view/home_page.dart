import 'package:dummy_json/src/di/di.dart';
import 'package:dummy_json/src/features/home/state/home_state.dart';
import 'package:dummy_json/src/features/home/viewmodel/home_viewmodel.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeViewModel = DI.getIt<HomeViewModel>();

  @override
  void initState() {
    super.initState();
    homeViewModel.getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dummy Posts"),
        actions: [
          IconButton(
            onPressed: () {
              homeViewModel.getPosts();
            },
            icon: const Icon(Icons.replay_outlined),
          )
        ],
      ),
      body: AnimatedBuilder(
        animation: homeViewModel,
        builder: (context, child) {
          if (homeViewModel.state is HomeStateLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: homeViewModel.posts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(homeViewModel.posts[index].title),
                );
              },
            );
          }
        },
      ),
    );
  }
}
