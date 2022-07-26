import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';

import '../widgets/custom_progress_indicator.dart';
import '../widgets/error_dialog.dart';
import '../widgets/quit_dialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late WebViewController controller;
  double progress = 0;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          if (await controller.canGoBack()) {
            controller.goBack();
          } else {
            showDialog(
              context: context,
              builder: (context) {
                return const QuitDialog();
              },
            );
          }
          return false;
        },
        child: Scaffold(
          body: Column(
            children: [
              CustomProgressIndicator(progress: progress),
              Expanded(
                child: WebView(
                  initialUrl: 'https://location.profilcar.com/connexion',
                  javascriptMode: JavascriptMode.unrestricted,
                  onWebViewCreated: (controller) {
                    this.controller = controller;
                  },
                  onProgress: (progress) {
                    setState(() => this.progress = progress / 100);
                  },
                  onWebResourceError: (webResourceError) {
                    showDialog(
                      context: context,
                      builder: (context) => ErrorDialog(controller: controller),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
