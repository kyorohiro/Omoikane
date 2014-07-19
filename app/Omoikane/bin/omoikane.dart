library omoikane;
import 'package:hetima/hetima.dart';
import 'package:hetima/hetima_sv.dart' as hetimasv;
import 'dart:core';
import 'dart:io';
import 'dart:async';
import 'dart:convert' as conv;
part 'setting.dart';

void main() {
  Setting setting = new Setting();
  setting.read().then((Map<String,Object> p){
    String ip = conv.UTF8.decode(p[Setting.KEY_IP]);
    String root = conv.UTF8.decode(p[Setting.KEY_ROOT]);
    int port = p[Setting.KEY_PORT];    
    hetimasv.HttpServer server = new hetimasv.HttpServer();
    server.host = ip;
    server.rootpath = root;
    server.port = port;
    server.start();
  });
}
