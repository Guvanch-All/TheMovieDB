import 'package:flutter/material.dart';
import 'package:the_movie_db/UI/main_screen/main_screen_widget.dart';

FocusNode myFocusNode = FocusNode();

class AuthWidget extends StatefulWidget {
  const AuthWidget({Key? key}) : super(key: key);

  @override
  _AuthWidgetState createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Login to your account',
                style: Theme.of(context).textTheme.headline6!)),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: ListView(
            children: const [
              SizedBox(height: 20),
              _TextField(),
              SizedBox(height: 25),
              _ActionButtons(),
              SizedBox(height: 20),
              _HeaderWidget(),
            ],
          ),
        ));
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'In order to use the editing and rating capabilities of '
          'TMDB, as well as get personal recommendations you will need to login to your account.'
          ' If you do not have an account,'
          ' registering for an account is free and simple.',
          style: Theme.of(context).textTheme.bodyText1,
        ),
        const SizedBox(height: 15),
        TextButton(
            onPressed: () {},
            child: Text(
              'Register',
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: const Color.fromRGBO(1, 180, 228, 1)),
            )),
        const SizedBox(height: 25),
        Text(
          "If you signed up but didn't get your verification email ",
          style: Theme.of(context).textTheme.bodyText1!,
        ),
        TextButton(
            onPressed: () {},
            child: Text(
              'Verify Email',
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: const Color.fromRGBO(1, 180, 228, 1)),
            )),
      ],
    );
  }
}

class _TextField extends StatefulWidget {
  const _TextField({Key? key}) : super(key: key);

  @override
  State<_TextField> createState() => _TextFieldState();
}

class _TextFieldState extends State<_TextField> {
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TextField(
          decoration: InputDecoration(
            labelText: 'Username',
          ),
        ),
        const SizedBox(height: 15),
        TextField(
          obscureText: obscurePassword,
          decoration: InputDecoration(
            labelText: 'Password',
            suffixIcon: IconButton(
              onPressed: () =>
                  setState(() => obscurePassword = !obscurePassword),
              icon: Icon(
                  obscurePassword ? Icons.visibility : Icons.visibility_off),
            ),
          ),
        ),
      ],
    );
  }
}

class _ActionButtons extends StatelessWidget {
  const _ActionButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 50,
          width: 140,
          child: RaisedButton(
            onPressed: () {
               Navigator.of(context).pushNamed('/main_screen');
              // Navigator.of(context).pushReplacementNamed('/main_screen');
            },
            child: Text(
              'Login',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
        ),
        const SizedBox(width: 50),
        TextButton(
            onPressed: () {},
            child: Text(
              'Reset Password',
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: const Color.fromRGBO(1, 180, 228, 1)),
            )),
      ],
    );
  }
}
