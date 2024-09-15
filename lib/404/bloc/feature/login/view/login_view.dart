import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_full_learn/202/image_learn_202.dart';
import 'package:flutter_full_learn/404/bloc/feature/login/cubit/login_cubit.dart';
import 'package:flutter_full_learn/404/bloc/feature/login/cubit/login_cubit_state.dart';
import 'package:flutter_full_learn/404/bloc/feature/login/service/login_service.dart';
import 'package:flutter_full_learn/product/service/vexana_network_manager.dart';
import 'package:kartal/kartal.dart';
import 'package:vexana/vexana.dart';
part 'login_view.g.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _loginText = 'Login';
  final GlobalKey<FormState> _formLoginKey = GlobalKey();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (context) => LoginCubit(LoginService(VexanaNetworkManager())),
      child: Scaffold(
        appBar: AppBar(
          title: BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              return state.isLoading
                  ? const CircularProgressIndicator(
                      color: Colors.green,
                    )
                  : const SizedBox();
            },
          ),
        ),
        body: Form(
          autovalidateMode: AutovalidateMode.always,
          key: _formLoginKey,
          child: Padding(
            padding: const PagePadding.all(),
            child: Column(
              children: [
                _LoginEmailFields(
                  emailController: _emailController,
                  passwordController: _passwordController,
                ),
                _LoginButton(
                    formLoginKey: _formLoginKey,
                    emailController: _emailController,
                    passwordController: _passwordController,
                    loginText: _loginText),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
