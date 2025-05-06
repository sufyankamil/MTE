import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hive/hive.dart';
import 'package:language_detector/language_detector.dart';
import 'package:translator/translator.dart';

import '../../api/user_api.dart';
import '../../model/posts_model.dart';

class UserPosts extends StatefulWidget {
  const UserPosts({super.key});

  @override
  State<UserPosts> createState() => _UserPostsState();
}

class _UserPostsState extends State<UserPosts> {
  late Future<List<PostsModel>> usersPosts;

  final translator = GoogleTranslator();

  Future<List<PostsModel>> getUsersPostsData() async {
    final box = await Hive.openBox('posts');

    if (box.isNotEmpty) {
      print("Box is not empty");
      List<dynamic> postsList = box.get('posts') ?? [];
      return postsList.map<PostsModel>((post) {
        return PostsModel.fromJson(Map<String, dynamic>.from(post));
      }).toList();
    } else {
      print("Box is empty");
      usersPosts = getUsersPosts();
      await box.put(
        'posts',
        usersPosts.then((posts) => posts.map((post) => post.toJson()).toList()),
      );
      return usersPosts;
    }
  }

  @override
  void initState() {
    super.initState();
    usersPosts = getUsersPostsData();
  }

  // Detect the language of the post's content
  Future<String> detectPostLanguage(String title, String body) async {
    String titleLanguage = await LanguageDetector.getLanguageCode(
      content: title,
    );
    String bodyLanguage = await LanguageDetector.getLanguageCode(content: body);

    // If both title and body have the same language, return that language
    if (titleLanguage == bodyLanguage) {
      return titleLanguage;
    } else {
      return 'unknown'; // Indeterminate language
    }
  }

  Future<Map<String, String>> translateText(String title, String body) async {
    final translatedTitle = await translator.translate(title, to: 'en');
    final translatedBody = await translator.translate(body, to: 'en');
    return {'title': translatedTitle.text, 'body': translatedBody.text};
  }

  void showTranslationBottomSheet(
    BuildContext context,
    String title,
    String body,
  ) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(26.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(body, style: const TextStyle(fontSize: 18)),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: !kIsWeb,
        title: const Text("Posts"),
        centerTitle: !kIsWeb,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                usersPosts = getUsersPostsData();
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
                final post = posts[index];

                return FutureBuilder<String>(
                  future: detectPostLanguage(post.title, post.body),
                  builder: (context, languageSnapshot) {
                    if (languageSnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const ListTile(
                        title: Text("Detecting language..."),
                        subtitle: Text("Please wait"),
                      );
                    } else if (languageSnapshot.hasData) {
                      String postLanguage = languageSnapshot.data!;

                      if (postLanguage != 'en') {
                        return ListTile(
                          title: Text(post.title),
                          subtitle: Text(post.body),
                          leading: CircleAvatar(
                            backgroundColor:
                                Colors.primaries[index %
                                    Colors.primaries.length],
                            child: Text(
                              post.id.toString(),
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                          onTap: () async {
                            Map<String, String> translatedContent =
                                await translateText(post.title, post.body);
                            showTranslationBottomSheet(
                              context,
                              translatedContent['title']!,
                              translatedContent['body']!,
                            );
                          },
                        );
                      } else {
                        return ListTile(
                          title: Text(post.title),
                          subtitle: Text(post.body),
                          leading: CircleAvatar(
                            backgroundColor:
                                Colors.primaries[index %
                                    Colors.primaries.length],
                            child: Text(
                              post.id.toString(),
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        );
                      }
                    } else {
                      return const ListTile(
                        title: Text("Error detecting language"),
                        subtitle: Text(
                          "Could not detect the language of this post.",
                        ),
                      );
                    }
                  },
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
