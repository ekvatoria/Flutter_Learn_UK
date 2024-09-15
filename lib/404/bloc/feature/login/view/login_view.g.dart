part of 'login_view.dart';

class _LoginButton extends StatelessWidget {
  const _LoginButton({
    super.key,
    required GlobalKey<FormState> formLoginKey,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required String loginText,
  })  : _formLoginKey = formLoginKey,
        _emailController = emailController,
        _passwordController = passwordController,
        _loginText = loginText;

  final GlobalKey<FormState> _formLoginKey;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;
  final String _loginText;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.isCompleted) {
          Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => route is ImageLearn202);
        }
      },
      builder: (context, state) {
        return BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
            return ElevatedButton(
              onPressed: () {
                if (_formLoginKey.currentState?.validate() ?? false) {
                  context.read<LoginCubit>().checkUser(_emailController.text, _passwordController.text);
                }
              },
              child: Padding(
                padding: const PagePadding.all(),
                child: Text('$_loginText - ${state.model?.email ?? ''}'),
              ),
            );
          },
        );
      },
    );
  }
}

class _LoginEmailFields extends StatelessWidget {
  const _LoginEmailFields(
      {super.key, required TextEditingController emailController, required TextEditingController passwordController})
      : _emailController = emailController,
        _passwordController = passwordController;

  final TextEditingController _emailController;
  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<LoginCubit, LoginState, bool>(
      selector: (state) {
        return state.isLoading;
      },
      builder: (context, state) {
        return IgnorePointer(
          ignoring: state,
          child: AnimatedOpacity(
            opacity: state ? 0.3 : 1,
            duration: Durations.medium1,
            child: Column(children: [
              Padding(
                padding: const PagePadding.bottom(),
                child: TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                  validator: (String? data) => data!.isNotEmpty ? null : 'Email is required',
                ),
              ),
              Padding(
                padding: const PagePadding.bottom(),
                child: TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(labelText: 'Password'),
                  validator: (String? data) => data!.isNotEmpty ? null : 'Password is required',
                ),
              )
            ]),
          ),
        );
      },
    );
  }
}

class PagePadding extends EdgeInsets {
  const PagePadding.all() : super.all(20);
  const PagePadding.bottom() : super.only(bottom: 10);
}
