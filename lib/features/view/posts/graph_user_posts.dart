import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphUserPosts extends StatefulWidget {
  const GraphUserPosts({super.key});

  @override
  State<GraphUserPosts> createState() => _GraphUserPostsState();
}

class _GraphUserPostsState extends State<GraphUserPosts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0XFF7F3DFF),
        title: Text(
          'GraphQL User Posts',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Query(
        options: QueryOptions(
          document: gql("""
            query GetItems {
                items {
                userId
                id
                title
                body
              }
            }
          """),
        ),
        builder: (QueryResult result, {fetchMore, refetch}) {
          print("result:$result");
          if (result.isLoading) {
            return Center(child: CircularProgressIndicator.adaptive());
          }

          if (result.hasException) {
            return Center(child: Text(result.exception.toString()));
          }

          final items = result.data?['items'];

          print("graph items: $items");

          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              print("graph in list view: $item");
              return ListTile(
                title: Text(item['name']),
                subtitle: Text(item['description']),
                isThreeLine: true,
              );
            },
          );
        },
      ),
    );
  }
}
