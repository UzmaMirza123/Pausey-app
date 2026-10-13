import 'package:flutter/material.dart';

import '../../data/models.dart';

/// Shown after a focus session ends. Placeholder — replaced by the real screen.
class SessionCompleteScreen extends StatelessWidget {
  const SessionCompleteScreen({super.key, this.session});
  final FocusSession? session;

  @override
  Widget build(BuildContext context) => const Scaffold(body: Center(child: Text('SessionCompleteScreen')));
}
