import 'package:flutter/material.dart';

class TextLearnView extends StatelessWidget {
  const TextLearnView({
    super.key,
    this.userName,
  });
  final String name = 'uğur';
  final String? userName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Wellcome $name ${name.length}',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.right,
            textScaler: const TextScaler.linear(1.5),
            style: ProjectStyles.welcomeStyle,
          ),
          Text(
            'Hello $name ${name.length}',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.right,
            textScaler: const TextScaler.linear(1.5),
            style: ProjectStyles.welcomeStyle,
          ),
          Text(
            'Hello $name ${name.length}',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.right,
            textScaler: const TextScaler.linear(1.5),
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(color: Colors.yellow),
          ),
          Text(userName ?? ""),
        ],
      )),
    );
  }
}

class ProjectStyles {
  static TextStyle welcomeStyle = const TextStyle(
      wordSpacing: 2,
      decoration: TextDecoration.underline,
      fontStyle: FontStyle.italic,
      color: Colors.lime,
      letterSpacing: 2,
      fontSize: 16,
      fontWeight: FontWeight.w600);
}


//TODO: V-2, T-2630