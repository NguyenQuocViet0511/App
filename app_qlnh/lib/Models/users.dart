
class Users{
  String _Username;
  String _Password;
  String _Status;
  String _LastLogin;

  Users(this._Username, this._Password, this._Status, this._LastLogin);


  String get Username => _Username;

  set Username(String value) {
    _Username = value;
  }

  String get Password => _Password;

  set Password(String value) {
    _Password = value;
  }


  String get Status => _Status;

  set Status(String value) {
    _Status = value;
  }




  String get LastLogin => _LastLogin;

  set LastLogin(String value) {
    _LastLogin = value;
  }






}