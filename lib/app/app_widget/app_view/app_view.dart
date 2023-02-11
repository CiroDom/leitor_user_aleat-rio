import 'package:ex_leitor_aleatorio/app/data/user_repository.dart';
import 'package:flutter/material.dart';
import '../../data/user.dart';

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  User? _user;
  String? _errorMessage;
  bool _loading = false;

  void _loadUser() async {
    try {
      setState(() => _loading = true);
      await Future.delayed(Duration(seconds: 2));

      final repository = UserRepository();
      final user = await repository.getUser();
      setState(() {
        _loading = false;
        _user = user;
      });
    } catch (e) {
      _loading = false;
      setState(() => _errorMessage = 'Usuário inválido');
    }
  }

  void _clearUser() {
    setState(() {
      _user = null;
      _errorMessage = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Builder(
            builder: (context) {
              if(_loading) {
                return const CircularProgressIndicator();
              }
              if(_errorMessage != null) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('$_errorMessage' ?? '', style: TextStyle(color: Colors.redAccent),),
                    TextButton(
                      onPressed: _clearUser,
                      child: const Text('Voltar'),
                    )
                  ],
                );
              }
              if(_user != null) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('$_user'),
                    TextButton(
                        onPressed: _clearUser,
                        child: const Text('Voltar'),
                    )
                  ],
                );
              }
              return ElevatedButton(
                  onPressed: _loadUser,
                  child: const Text('Clique aqui'),
              )
            },
        ),
      ),
    );
  }
}