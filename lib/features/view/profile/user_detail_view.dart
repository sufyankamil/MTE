import 'package:flutter/material.dart';

class UserDetailView extends StatefulWidget {
  const UserDetailView({super.key, required this.user});

  final dynamic user;

  @override
  State<UserDetailView> createState() => _UserDetailViewState();
}

class _UserDetailViewState extends State<UserDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.user.name}'s Profile"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Center(
              child: CircleAvatar(
                radius: 50,
                child: Text(
                  widget.user.name[0].toUpperCase() +
                      widget.user.name[1].toUpperCase(),
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              widget.user.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              '${widget.user.username}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10),
            Text(
              widget.user.email,
              style: const TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            ListTile(
              title: const Text("Address"),
              subtitle: Text(
                "${widget.user.address.street} ${widget.user.address.suite}, ${widget.user.address.city}, ${widget.user.address.zipcode}",
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
              leading: const Icon(Icons.location_on),
            ),
            ListTile(
              title: const Text("Phone"),
              subtitle: Text(
                widget.user.phone,
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
              leading: const Icon(Icons.phone),
            ),
            ListTile(
              title: const Text("Website"),
              subtitle: Text(
                widget.user.website,
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
              leading: const Icon(Icons.web),
            ),
            ListTile(
              title: const Text("Posts"),
              subtitle: Text("View all posts",
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
              leading: const Icon(Icons.post_add_outlined),
              onTap: () {
                Navigator.pushNamed(context, '/posts');
              },
            ),

          ],
        ),
      ),
    );
  }
}
