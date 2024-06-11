class UsernameService{
  static final UsernameService _singleton = UsernameService._internal();
  UsernameService._internal();

  factory UsernameService(){
    return _singleton;
  }

  String username = '';
}