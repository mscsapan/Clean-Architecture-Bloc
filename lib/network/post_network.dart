import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class PostNetwork {
  Future<bool> get getConnected;
}

class PostNetworkImpl implements PostNetwork {
  InternetConnectionChecker internetConnection;

  PostNetworkImpl(this.internetConnection);

  @override
  Future<bool> get getConnected => internetConnection.hasConnection;
}
