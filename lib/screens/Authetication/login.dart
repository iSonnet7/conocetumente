import 'package:conocetumente/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  final Function? toggleScreen;

  const Login({Key? key, this.toggleScreen}) : super(key: key);
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  final _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<AuthServices>(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios,
                        color: Theme.of(context).primaryColor),
                    onPressed: () {},
                  ),
                  SizedBox(height: 100),
                  Text(
                    "Bienvenido de vuelta",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Inicie sesion para continuar",
                    style: TextStyle(fontSize: 22, color: Colors.grey),
                  ),
                  SizedBox(height: 30),
                  TextFormField(
                    controller: _emailController,
                    validator: (val) => val!.isNotEmpty
                        ? null
                        : "Por favor, introduzca una dirección electronica", //Verificar que el campo no este vacio
                    decoration: InputDecoration(
                        hintText: "Correo",
                        prefixIcon: Icon(Icons.mail),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                  ),
                  SizedBox(height: 30),
                  TextFormField(
                    controller: _passwordController,
                    validator: (val) => val!.isNotEmpty
                        ? null
                        : "Por favor, introduzca una contraseña", //Verificar que el campo no este vacio
                    decoration: InputDecoration(
                        hintText: "Contraseña",
                        prefixIcon: Icon(Icons.vpn_key),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                  ),
                  SizedBox(height: 30),
                  MaterialButton(
                    onPressed: () async {
                      if (_formkey.currentState!.validate()) {
                        print("Correo: ${_emailController.text}");
                        print("Contraseña: ${_passwordController.text}");
                        await loginProvider.login(_emailController.text.trim(), _passwordController.text.trim());
                      }
                    },
                    height: 70,
                    minWidth: loginProvider.isLoading ? null : double.infinity,
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: loginProvider.isLoading
                        ? CircularProgressIndicator()
                        : Text(
                            "Ingresar",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("¿No tiene una cuenta? "),
                      SizedBox(width: 10),
                      TextButton(
                          onPressed: () => widget.toggleScreen!(),
                          child: Text("Registrar"))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
