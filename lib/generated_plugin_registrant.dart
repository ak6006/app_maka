//
// Generated file. Do not edit.
//

// ignore: unused_import
import 'dart:ui';

import 'package:connectivity_for_web/connectivity_for_web.dart';
import 'package:firebase_core_web/firebase_core_web.dart';
import 'package:shared_preferences_web/shared_preferences_web.dart';

import 'package:flutter_web_plugins/flutter_web_plugins.dart';

// ignore: public_member_api_docs
void registerPlugins(PluginRegistry registry) {
  ConnectivityPlugin.registerWith(registry.registrarFor(ConnectivityPlugin));
  FirebaseCoreWeb.registerWith(registry.registrarFor(FirebaseCoreWeb));
  SharedPreferencesPlugin.registerWith(registry.registrarFor(SharedPreferencesPlugin));
  registry.registerMessageHandler();
}
