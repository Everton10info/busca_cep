import 'package:busca_cep/shared/theme/app_fonts.dart';
import 'package:flutter/material.dart';

import '../../../shared/services/http_client.dart';
import '../../../shared/theme/app_colors.dart';
import '../controllers/search_controller.dart';
import '../models/cep_model.dart';
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
                            setState(() {
                              load = true;
                            });
                            await Future.delayed(const Duration(seconds: 2));
                            controller
                                .getCep(controller.fieldCep.text)
                                .then((value) {
                              setState(() {
                                load = false;
                              });
                              Navigator.of(context).pushNamed(ResultPage.result,
                                  arguments: value as CepModel);
                            });
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
