
part of omoikane;
class Setting {
  static final String KEY_IP = "ip";
  static final String KEY_PORT = "port";
  static final String KEY_ROOT = "root";
  String settingfilePath = "../../../setting";

  Future<Map<String, Object>> read() {
    Completer<Map<String, Object>> completer = new Completer();
    Future s = new Future.sync(() {
      File fpath = new File(settingfilePath);
      return fpath.readAsBytes().then((List<int> buffer) {
        Map<String,Object> obj = Bencode.decode(buffer);
        completer.complete(obj as Map<String, Object>);
      });
    }).catchError((e) {
      Map<String, Object> r = new Map();
      completer.complete(r);
    });
    return completer.future;
  }

  Future<bool> write(Map<String,Object> v) {
    Completer<bool> completer = new Completer();
    Future s = new Future.sync(() {
      List<int> buffer = Bencode.encode(v);
      File fpath = new File(settingfilePath);
      return fpath.writeAsBytes(buffer);
    }).catchError((e) {
      completer.complete(false);
    }).whenComplete((){
      if(!completer.isCompleted) {
        completer.complete(true);
      }
    });
    return completer.future;
  }
}
