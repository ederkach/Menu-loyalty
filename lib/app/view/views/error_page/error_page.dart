import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({
    super.key,
    required this.onCantPopNavigationAction,
  });

  final Function onCantPopNavigationAction;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Spacer(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "Requested page does not exist or can't be displayed.",
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              constraints: const BoxConstraints(maxWidth: 300),
              child: context.canPop()
                  ? ElevatedButton(
                      onPressed: () => context.pop(),
                      child: const Text("Go back"),
                    )
                  : ElevatedButton(
                      onPressed: () => onCantPopNavigationAction(),
                      child: const Text("To main page"),
                    ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
