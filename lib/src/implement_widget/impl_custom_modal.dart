import 'package:flutter/material.dart';
import '../view/widgets/custom_modal.dart'; // Sesuaikan dengan lokasi file widget ini

class ImplCustomModal extends StatelessWidget {
  const ImplCustomModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Custom Modal Example')),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => CustomModal(
                  header: 'Header Modal',
                  body: const Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis aliquet fermentum odio a posuere. Maecenas feugiat non erat eget dapibus. Nulla facilisi. Ut sit amet tempor nisi. Nullam id lorem odio. Sed in justo vel eros sagittis venenatis. Maecenas vulputate lacus risus, nec mollis lectus pharetra a. Mauris et sodales nibh. Praesent sollicitudin, neque a lacinia rutrum, nisi arcu volutpat dolor, vel viverra lorem mi pharetra quam. Sed blandit dolor vitae viverra feugiat. Sed dictum lobortis sem quis suscipit. Sed laoreet dolor mollis massa luctus, non accumsan purus porttitor. Pellentesque eros purus, tempor in nulla nec, tempor vestibulum nibh. Aliquam molestie mi lacinia, pulvinar dui sit amet, vehicula libero. Aliquam lobortis enim et metus faucibus accumsan. Aenean malesuada condimentum lectus, ac tincidunt enim cursus in.'),
                  footerButtons: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Cancel'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Action button
                        Navigator.of(context).pop();
                      },
                      child: const Text('OK'),
                    ),
                  ],
                ),
              );
            },
            child: const Text('Show Modal'),
          ),
        ),
      ),
    );
  }
}
