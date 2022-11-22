import 'package:busca_cep/modules/search_cep/models/cep_model.dart';
import 'package:flutter/material.dart';

import '../../../shared/theme/app_colors.dart';
import '../../../shared/theme/app_fonts.dart';
import '../controllers/search_controller.dart';
import '../repositories/repository.dart';
import 'result_page.dart';

class HomePage extends StatefulWidget {
  static String home = '/home';

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoaded = false;
  final _formKey = GlobalKey<FormState>();
  CepModel? cepModel;

  HomeController controller = HomeController(HomeRepository());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: isLoaded
          ? const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Scaffold(
              appBar: AppBar(
                elevation: 0,
                title: Center(
                  child: Text('HOME', style: AppFonts.headline24W900.getFont),
                ),
              ),
              body: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('CEP', style: AppFonts.headline24Bold.getFont),
                    const SizedBox(height: 16),
                    Form(
                      key: _formKey,
                      child: TextFormField(
                        controller: controller.fieldCep,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                        keyboardType: TextInputType.number,
                        maxLength: 8,
                        decoration: InputDecoration(
                          constraints: const BoxConstraints(
                              maxHeight: 75, minHeight: 40),
                          hintText: '000000000',
                          hintStyle: TextStyle(
                              color: AppColors.grey.getColor, fontSize: 16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Digite um cep, por favor!';
                          }
                          return null;
                        },
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 48,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        )),
                        onPressed: () => onPressed(),
                        child: const Text(
                          'Pesquisar',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }

  void onPressed() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoaded = true;
      });

      controller.getCep(controller.fieldCep.text).then(
        (value) {
          Future.delayed(const Duration(seconds: 2)).then(
            (value) => setState(() {
              isLoaded = false;
            }),
          );
          if (value.runtimeType == String) {
            _buildSnackBar(
              context,
              AppColors.red.getColor,
              value,
            );
          } else {
            if (value.cep == null) {
              _buildSnackBar(
                context,
                AppColors.red.getColor,
                'Cep não existe ou não encontrado...',
              );
            } else {
              Navigator.of(context).pushNamed(
                ResultPage.result,
                arguments: value,
              );
              _buildSnackBar(
                context,
                AppColors.green.getColor,
                'Cep encontrado com sucesso!!!',
              );
            }
          }
        },
      );
    }
  }

  _buildSnackBar(context, Color backgroundColor, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: backgroundColor,
        content: Text(
          message,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
