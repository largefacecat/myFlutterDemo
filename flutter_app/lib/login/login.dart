
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget{
  @override
  LoginState createState() {
    // TODO: implement createState
    return new LoginState();
  }

}

class LoginState extends State<Login>{
  final _formKey = new GlobalKey<FormState>();

  String _userId;
  String _password;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: CupertinoNavigationBar(
        backgroundColor: Colors.white,
        middle: const Text('登录'),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(top: 30),
            height: 220,
            child: Image(
              image: AssetImage('assets/images/login.jpg'),
            ),
          ),
          Form(
            key: _formKey,
            child: Container(
              height: 122,
              padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
              child: Card(
                child: Column(
                  children: <Widget>[
                    _showUserIdInput(),
                    Divider(
                      height: 0.5,
                      indent: 16.0,
                      color: Colors.grey[300],
                    ),
                    _showPasswordInput(),
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 70,
            padding: const EdgeInsets.fromLTRB(35, 30, 35, 0),
            child: OutlineButton(
              child: Text('登录'),
              textColor: Colors.orangeAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              borderSide: BorderSide(
                color: Colors.orangeAccent,
                width: 1,
              ),
              onPressed: (){
                _onLogin();
              },
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.fromLTRB(40, 10, 50, 0),
          //   child: O
          // ),

        ],
      )
    );
  }

  void _showMessageDialog(String message){
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: new Text('提示'),
          content: new Text(message),
          actions: <Widget>[
            new FlatButton(
                onPressed: (){
                  Navigator.of(context).pop();
                },
                child: new Text('OK'))
          ],
        );
      }
    );
  }
  
  void _changeFormToLogin(){
    _formKey.currentState.reset();
  }

  void _onLogin(){
    final form = _formKey.currentState;
    form.save();

    if(_userId == ''){
      _showMessageDialog('账号不能为空');
      return;
    }

    if(_password == ''){
      _showMessageDialog('密码不能为空');
      return;
    }
  }

  Widget _showUserIdInput(){
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
      child: new TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.text,
        autofocus: false,
        style: TextStyle(fontSize: 15),
        decoration: new InputDecoration(
          border: InputBorder.none,
          hintText: '请输入账号',
          icon: new Icon(
            Icons.account_box,
            color: Colors.grey,
          )
        ),
        onSaved: (value) => _userId = value.trim(),
      ),
    );
  }
  Widget _showPasswordInput(){
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
      child: new TextFormField(
        maxLines: 1,
        obscureText: true,
        autofocus: false,
        style: TextStyle(fontSize: 15),
        decoration: new InputDecoration(
            border: InputBorder.none,
            hintText: '请输入密码',
            icon: new Icon(
              Icons.lock,
              color: Colors.grey,
            )
        ),
        onSaved: (value) => _password = value.trim(),
      ),
    );
  }
}

