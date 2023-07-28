import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  testRemoteConfig();
}

void testRemoteConfig() async {
  final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;

  try {
    await remoteConfig.setDefaults(<String, dynamic>{
      'show_done_tasks': false,
    });
    await remoteConfig.fetchAndActivate();

    bool showDoneTasks = remoteConfig.getBool('show_done_tasks');

    print('Show done tasks: $showDoneTasks');
  } catch (exception) {
    print('Fetch throttled: $exception');
  } catch (exception) {
    print(
        'Unable to fetch remote config. Cached or default values will be used');
  }
}
