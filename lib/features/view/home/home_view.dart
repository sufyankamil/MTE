import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

import '../settings/settings_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0XFF7F3DFF),
        title: const Text(
          "Welcome to Montra.",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsView()),
              );
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 20,
        children: [
          kIsWeb
              ? const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Sorry, this feature is not available on the web.",
                  style: TextStyle(fontSize: 18),
                ),
              )
              : Expanded(
                child: const ModelViewer(
                  backgroundColor: Color(0XFF7F3DFF),
                  src:
                      'https://modelviewer.dev/shared-assets/models/Astronaut.glb',
                  alt: 'A 3D model of an astronaut',
                  ar: true,
                  autoRotate: true,
                  iosSrc:
                      'https://modelviewer.dev/shared-assets/models/Astronaut.usdz',
                  disableZoom: false,
                ),
              ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Explore the features of Montra.",
              style: TextStyle(fontSize: 18),
            ),
          ),
          GridView.count(
            crossAxisCount: 4,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              InkWell(
                onTap: (){
                  Navigator.pushNamed(context, '/accountSetup');
                },
                child: Card(
                  color: const Color(0XFF7F3DFF),
                  child: Center(
                    child: const Text(
                      "Account Setup",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  Navigator.pushNamed(context, '/add-new-account');
                },
                child: Card(
                  color: const Color(0XFF7F3DFF),
                  child: Center(
                    child: const Text(
                      "Add New Account",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  Navigator.pushNamed(context, '/verification');
                },
                child: Card(
                  color: const Color(0XFF7F3DFF),
                  child: Center(
                    child:  const Text(
                      "Set Pin",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SettingsView(),
                    ),
                  );
                },
                child: Card(
                  color: const Color(0XFF7F3DFF),
                  child: Center(
                    child: const Text(
                      "Settings",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
