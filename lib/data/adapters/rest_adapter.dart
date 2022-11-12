
// Adapter Pattern
abstract class RestAdapter {

  Future<Object> get(String url, Function decode);

}

