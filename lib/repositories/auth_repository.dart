abstract class AuthenticationRepository {
  Future<bool> signIn();
}

class AuthenticationRepositoryIml extends AuthenticationRepository {

  @override
  Future<bool> signIn() async {

    return true;
  }
}
