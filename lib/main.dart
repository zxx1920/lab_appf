import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lab_appf/config.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController _userName = TextEditingController();
  TextEditingController _passWord = TextEditingController();

  void onLogin() {
    //parameter
    Map params = {
      'userName': _userName.text,
      'passWord': _passWord.text
    };
    http.post('${Config.API_URL}/user/login', body: params).then((res) {
      print(res.body);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: ListView(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(hintText: ': User name'),
            controller: _userName,
          ),
          TextField(
            decoration: InputDecoration(hintText: ': Pass word'),
            obscureText: true,
            controller: _passWord,
          ),
          RaisedButton(child: Text('login'), onPressed: onLogin),
          FlatButton(
            child: Text('ลงทะเบียน'),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Register()));
            },
          ),
        ],
      ),
    );
  }
}

class Register extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Register();
  }
}

class _Register extends State {
  TextEditingController _userId = TextEditingController();
  TextEditingController _passWord = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _surName = TextEditingController();

  void onRegister() {
    Map parms = Map();
    parms['userName'] = _userId.text;
    parms['passWord'] = _passWord.text;
    parms['firstName'] = _name.text;
    parms['lastName'] = _surName.text;
    http.post('${Config.API_URL}/user/register', body: parms).then((res) {
      print(res.body);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('ลงทะเบียน'),
      ),
      body: ListView(
        padding: EdgeInsets.only(left: 10, right: 10),
        children: <Widget>[
          TextField(
            decoration: InputDecoration(hintText: ': user id'),
            controller: _userId,
          ),
          TextField(
            decoration: InputDecoration(hintText: ': pass word'),
            controller: _passWord,
          ),
          TextField(
            decoration: InputDecoration(hintText: ': ขื่อ'),
            controller: _name,
          ),
          TextField(
            decoration: InputDecoration(hintText: ': นามสกุล'),
            controller: _surName,
          ),
          RaisedButton(child: Text('ตกลง'), onPressed: onRegister)
        ],
      ),
    );
  }
}
