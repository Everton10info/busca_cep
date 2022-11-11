import 'package:busca_cep/shared/theme/app_fonts.dart';
import 'package:flutter/material.dart';

import '../../../shared/services/http_client.dart';
import '../../../shared/theme/app_colors.dart';
import '../controllers/search_controller.dart';
import '../repositories/repository.dart';
import 'result_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static String home = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool load = false;
  final _formKey = GlobalKey<FormState>();
  HomeController controller = HomeController(
    HomeRepository(ClientHttp()),
  );
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: load
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
              body: Center(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
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
                          maxLength: 9,
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
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                load = true;
                              });

                              controller
                                  .getCep(controller.fieldCep.text)
                                  .then((value) {
                                if (value.runtimeType == String) {
                                  setState(() {
                                    load = true; // tratar erros
                                  });

                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          backgroundColor:
                                              AppColors.red.getColor,
                                          content: Text(
                                            value,
                                            textAlign: TextAlign.center,
                                          )));
                                  Future.delayed(const Duration(seconds: 5));
                                  setState(
                                    () {
                                      load = false;
                                    },
                                  );
                                } else {
                                  Navigator.of(context).pushNamed(
                                      ResultPage.result,
                                      arguments: value);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          backgroundColor:
                                              AppColors.green.getColor,
                                          content: const Text(
                                            'Endereço encontrado com sucesso!',
                                            textAlign: TextAlign.center,
                                          )));
                                  setState(
                                    () {
                                      load = false;
                                    },
                                  );
                                }
                              });
                            }
                          },
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
            ),
    );
  }
}
