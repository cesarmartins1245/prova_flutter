import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:prova_flutter/pages/home/home_controller.dart';
import 'package:prova_flutter/pages/home/mobx_text_store.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _textEditingController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  late MobxTextStore _store;

  @override
  void initState() {
    super.initState();
    _initializeStore();
  }

  void _initializeStore() async {
    _store = MobxTextStore();
    await _store.init();
    _store.loadData();
  }

  void _editText(int index, String newText) {
    _store.editText(index, newText);
  }

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());
    return GestureDetector(
      onTap: () {
        if (_focusNode.hasFocus) {
          _focusNode.unfocus();
        }
      },
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xff1c5163),
                Color(0xff2d958e),
              ],
            ),
          ),
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xff1c5163),
                    Color(0xff2d958e),
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.6,
                      width: Get.width * 0.8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
                      ),
                      child: Observer(
                        builder: (context) {
                          return ListView.separated(
                            shrinkWrap: true,
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Divider(
                                color: Colors.grey,
                                thickness: 1,
                              ),
                            ),
                            itemCount: _store.textList.length,
                            itemBuilder: (context, index) {
                              final text = _store.textList[index];
                              return Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Observer(
                                        builder: (context) {
                                          if (_store.editingIndex == index) {
                                            return TextFormField(
                                              focusNode: _focusNode,
                                              initialValue: text,
                                              autofocus: true,
                                              onFieldSubmitted: (value) {
                                                _editText(index, value);
                                                _store.setEditingIndex(-1);
                                              },
                                            );
                                          } else {
                                            return Text(
                                              text,
                                              style:
                                                  const TextStyle(fontSize: 16),
                                            );
                                          }
                                        },
                                      ),
                                    ),
                                    IconButton(
                                      icon: const Icon(
                                        Icons.edit,
                                        size: 30,
                                      ),
                                      onPressed: () {
                                        _store.setEditingIndex(index);
                                        FocusScope.of(context)
                                            .requestFocus(_focusNode);
                                      },
                                    ),
                                    IconButton(
                                      icon: const Icon(
                                        Icons.cancel,
                                        color: Colors.red,
                                        size: 40,
                                      ),
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: const Text(
                                                'Confirmar exclusão',
                                              ),
                                              content: const Text(
                                                'Tem certeza de que deseja excluir este item?',
                                              ),
                                              actions: <Widget>[
                                                TextButton(
                                                  onPressed: () => Get.back(),
                                                  child: const Text('Cancelar'),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    _store.removeText(index);
                                                    Get.back();
                                                  },
                                                  child: const Text(
                                                    'Excluir',
                                                    style: TextStyle(
                                                      color: Colors.red,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: Container(
                        width: Get.width * 0.8,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: TextFormField(
                          controller: _textEditingController,
                          decoration: const InputDecoration(
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            hintText: 'Digite seu texto',
                            border: InputBorder.none,
                          ),
                          textAlign: TextAlign.center,
                          onFieldSubmitted: (value) {
                            if (value.isNotEmpty) {
                              _store.addText(value);
                              _textEditingController.clear();
                            }
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextButton(
                      onPressed: () {
                        controller.openGoogle();
                      },
                      child: Text(
                        'Política de Privacidade',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
