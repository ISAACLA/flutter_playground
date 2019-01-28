import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<Login> {
  final String _emailRegex =
      r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: _backGroundImage(),
        ),
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              child: Form(
                child: Column(
                  children: <Widget>[
                    _emailInput(),
                    SizedBox(height: 10.0),
                    _passwordInput(),
                    SizedBox(height: 10.0),
                    _loginButton(),
                    SizedBox(height: 10.0),
                    _switchAuth(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  DecorationImage _backGroundImage() {
    return DecorationImage(
        fit: BoxFit.cover,
        colorFilter:
            ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstATop),
        image: AssetImage('assets/auth.jpg'));
  }

  Widget _emailInput() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'email@email.com',
        filled: true,
        fillColor: Colors.white,
      ),
      keyboardType: TextInputType.emailAddress,
      validator: (String value) {
        if (value.isEmpty || !RegExp(_emailRegex).hasMatch(value)) {
          return 'Please enter a valid email';
        }
      },
    );
  }

  Widget _passwordInput() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Password',
          hintText: '********',
          filled: true,
          fillColor: Colors.white),
      obscureText: true,
      validator: (String value) {
        if (value.isEmpty || value.length < 8) {
          return 'Password invalid';
        }
      },
    );
  }

  Widget _loginButton() {
    return RaisedButton(
      child: Text(
        'Login',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      color: Theme.of(context).primaryColor,
      onPressed: () {
        Navigator.pushReplacementNamed(context, 'home');
      },
    );
  }

  Widget _switchAuth() {
    return GestureDetector(
      child: Text('Register'),
      onTap: () {
        print('Registering');
      },
    );
  }
}
