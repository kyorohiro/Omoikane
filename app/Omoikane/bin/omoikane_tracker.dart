library trackerserver;
import 'package:hetima/hetima.dart';
import 'package:hetima/hetima_sv.dart' as hetimasv;
import 'dart:async';
import 'dart:io';
import 'dart:convert' as conv;
import 'dart:typed_data';
part 'omoikane_tracker_setting.dart';

void main() {
  TrackerSetting setting = new TrackerSetting();
  setting.read().then((Map<String, Object> p) {
    hetimasv.TrackerServer server = new hetimasv.TrackerServer();
    server.address = TrackerSetting.getIp(p, server.address);
    server.port = TrackerSetting.getPort(p, server.port);
    List<String> list = TrackerSetting.getHashlist(p);
    for (String p in list) {
      server.add(p);
    }
    server.start();
  });
}
