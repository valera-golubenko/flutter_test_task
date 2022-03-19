import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class HomeP extends StatefulWidget {
  const HomeP({Key? key}) : super(key: key);

  @override
  State<HomeP> createState() => _HomePState();
}

class _HomePState extends State<HomeP> {
  final maskFormatter = MaskTextInputFormatter(
      mask: '(###) ###-####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);
  final textcontroler = TextEditingController();
  bool isShowClearButton = false;
  bool isShowNextButton = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textcontroler.addListener(() {
      setState(() {
        isShowClearButton = textcontroler.text.isNotEmpty;
        final cleanNumber = maskFormatter.unmaskText(textcontroler.text);
        isShowNextButton = cleanNumber.length >= 10;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Get Started",
              style: TextStyle(fontSize: 30),
            ),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: TextField(
                autofocus: true,
                inputFormatters: [maskFormatter],
                controller: textcontroler,
                style: const TextStyle(fontSize: 22),
                decoration: InputDecoration(
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  suffixIcon: AnimatedOpacity(
                    duration: const Duration(milliseconds: 250),
                    opacity: isShowClearButton ? 1 : 0,
                    child: IconButton(
                      onPressed: textcontroler.clear,
                      icon: const Icon(Icons.cancel_sharp),
                      color: Colors.grey,
                    ),
                  ),
                  contentPadding: const EdgeInsets.all(5),
                  helperText: "Enter your phone number",
                  hintText: "(201) 555 - 0123",
                ),
                keyboardType: TextInputType.phone,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: AnimatedOpacity(
        duration: const Duration(milliseconds: 250),
        opacity: isShowNextButton ? 1 : 0,
        child: FloatingActionButton(
          onPressed: () {
            print('next');
          },
          backgroundColor: Colors.blue,
          child: const Icon(Icons.arrow_forward),
        ),
      ),
    );
  }
}
