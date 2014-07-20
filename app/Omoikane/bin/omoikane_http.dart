library omoikane_http;
import 'package:hetima/hetima.dart';
import 'package:hetima/hetima_sv.dart' as hetimasv;
import 'dart:core';
import 'dart:io';
import 'dart:async';
import 'dart:convert' as conv;
part 'omoikane_http_setting.dart';

void main() {
  HttpSetting setting = new HttpSetting();
  setting.read().then((Map<String,Object> p){
    String ip = conv.UTF8.decode(p[HttpSetting.KEY_IP]);
    String root = conv.UTF8.decode(p[HttpSetting.KEY_ROOT]);
    int port = p[HttpSetting.KEY_PORT];    
    hetimasv.HttpServer server = new hetimasv.HttpServer();
    server.host = ip;
    server.rootpath = root;
    server.port = port;
    server.start();
  });
}
