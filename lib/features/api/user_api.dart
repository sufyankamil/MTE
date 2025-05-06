import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:montra_expense_tracker/common/constants.dart';
import 'package:montra_expense_tracker/features/model/posts_model.dart';
import 'package:montra_expense_tracker/features/model/user_model.dart';

Future<List<UserModel>> getUsers() async {
  final response = await http.get(
    Uri.parse('https://jsonplaceholder.typicode.com/users'),
  );

  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((user) {
      return UserModel.fromJson(user);
    }).toList();
  } else {
    throw Exception('Failed to load user data');
  }
}

Future<List<PostsModel>> getUsersPosts() async {
  print("Fetching user posts");
  final response = await http.get(Uri.parse(Constants.postsUrl));

  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((post) {
      return PostsModel.fromJson(post);
    }).toList();
  } else {
    throw Exception('Failed to load user post');
  }
}
