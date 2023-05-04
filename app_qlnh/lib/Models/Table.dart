class tableItems {
  String _TableID;
  String _Tablename;
  String _TrangThai;

  tableItems(this._TableID, this._Tablename,this._TrangThai);


  String get TrangThai => _TrangThai;

  set TrangThai(String value) {
    _TrangThai = value;
  }


  String get TableID => _TableID;

  set TableID(String value) {
    _TableID = value;
  }


  String get Tablename => _Tablename;

  set Tablename(String value) {
    _Tablename = value;
  }

}
