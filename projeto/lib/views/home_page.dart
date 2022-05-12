import 'package:flutter/material.dart';
import 'package:mobx_widget/mobx_widget.dart';
import 'package:projeto/controllers/home_controller.dart';
import 'package:projeto/models/post_model.dart';

class HomePage extends StatelessWidget {
  var controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aprendendo http'),
      ),
      body: ObserverFuture<List<PostModel>, Exception>(
        // Use this widget to handle ObservableFuture events
        retry: 2, // It will retry 2 times after the first error event
        autoInitialize: true, // If true, it will call [fetchData] automatically
        fetchData: () {
          controller.preencherListaPost();
        }, // VoidCallback

        observableFuture: () => controller.posts,

        onData: (_, data) => Center(
          child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                var post = data[index];
                return Column(
                  children: [
                    Container(
                      height: 200,
                      width: 400,
                      color: Colors.blue,
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Text('Titulo:' + post.title),
                            Text('Conteudo do post: ' + post.body)
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                );
              }),
        ),

        onError: (_, error) => Center(
          child: Center(child: Text('Ocorreu um erro')),
        ),

        onPending: (_) => Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      ),
    );
  }
}
