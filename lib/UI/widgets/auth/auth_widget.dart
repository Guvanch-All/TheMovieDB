import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:the_movie_db/Library/Widget/Inherited/provider.dart';
import 'package:the_movie_db/utils/style_constants.dart';

import 'model/auth_model.dart';

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
              _FormWidget(),
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

class _FormWidget extends StatelessWidget {
  const _FormWidget({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    final model = NotifierProvider.read<AuthModel>(context);
    bool obscurePassword = true;
    return Column(
      children: [
        const _ErrorMessageWidget(),
        TextField(
          controller: model?.loginTextController,
          decoration: const InputDecoration(
            labelText: 'Username',
          ),
        ),
        const SizedBox(height: 15),
        TextField(
          controller: model?.passwordTextController,
          obscureText: obscurePassword,
          decoration: InputDecoration(
            labelText: 'Password',
            suffixIcon: IconButton(
              onPressed: () {},
              // setState(() => obscurePassword = !obscurePassword),
              icon: Icon(
                  obscurePassword ? Icons.visibility : Icons.visibility_off),
            ),
          ),
        ),
        const SizedBox(height: 25),
        Row(
          children: [
            const SizedBox(
              height: 50,
              width: 140,
              child: _AuthButtonWidget(),
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
        ),
      ],
    );
  }
}

class _AuthButtonWidget extends StatelessWidget {
  const _AuthButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<AuthModel>(context);
    final onPressed =
        model?.canStartAuth == true ? () => model?.auth(context) : null;
    final text = model?.isAuthProgress == true
        ?  const SizedBox(
            height: 15, width: 15, child: SpinKitDualRing(color: Colors.grey,))
        : Text('Login',
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(fontWeight: FontWeight.bold, color: Colors.white));
    return ElevatedButton(
      onPressed: onPressed,
      child: text,
    );
  }
}

class _ErrorMessageWidget extends StatelessWidget {
  const _ErrorMessageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final errorMessage = NotifierProvider.watch<AuthModel>(context)?.errorMessage;
    if (errorMessage == null) {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Text(errorMessage,
          style: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(color: ltPrimaryRedColor)),
    );
  }
}
