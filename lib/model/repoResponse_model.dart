class RepositoryResponse{

  bool _success;
  String _msg;
  int _code;

  int get code => _code;

  set code(int value) {
    _code = value;
  }

  dynamic _data;

  dynamic get data => _data;


  set data(dynamic value) {
    _data = value;
  }


  bool get success => _success;

  set success(bool value) {
    _success = value;
  }

  String get msg => _msg;

  set msg(String value) {
    _msg = value;
  }

  @override
  String toString() {
    return 'RepositoryResponse{_success: $_success, _msg: $_msg, _code: $_code, _data: $_data}';
  }
}