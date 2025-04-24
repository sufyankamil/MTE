import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../api/user_api.dart';
import '../../model/posts_model.dart';

class UserPosts extends StatefulWidget {
  const UserPosts({super.key});

  @override
  State<UserPosts> createState() => _UserPostsState();
}

class _UserPostsState extends State<UserPosts> {
  late Future<List<PostsModel>> usersPosts;

  @override
  void initState() {
    super.initState();
    usersPosts = getUsersPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Posts"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                usersPosts = getUsersPosts();
              });
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: usersPosts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator.adaptive());
          } else if (snapshot.hasError) {
            SchedulerBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    "${snapshot.error}",
                    style: TextStyle(color: Colors.white),
                  ),
                  duration: const Duration(seconds: 2),
                  backgroundColor: Colors.red,
                ),
              );
            });
            return const Center(
              child: Text(
                "Error loading data",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
            );
          } else if (snapshot.hasData) {
            List<PostsModel> posts = snapshot.data!;
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(posts[index].title),
                  subtitle: Text(posts[index].body),
                  leading: CircleAvatar(
                    backgroundColor:
                        posts[index].id.toString().length.isEven
                            ? Colors.blue
                            : Colors.red,
                    child: Text(posts[index].id.toString()),
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text("No data found"));
          }
        },
      ),
    );
  }
}
