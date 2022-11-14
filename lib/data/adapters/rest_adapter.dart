
// Adapter Pattern
abstract class RestAdapter {

  Future<T> get<T>(String url);

}

