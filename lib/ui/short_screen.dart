import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:url_shortener/controller/provider/url_shortner_provider.dart';
// import 'package:provider/provider.dart';
// import 'package:url_shortener_app/screens/url_shortener_state.dart';

class UrlShortenerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final state = Provider.of<UrlShortenerState>(context, listen: true);
    final state=Provider.of<UrlShortenerState>(context,listen: true);


    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(32),
        width: double.infinity,
        child: Column(
          children: [
            const Spacer(),
            Text(
              "URL Shortner",
              style: TextStyle(
                fontSize: 40,
                color: Colors.blue[600],
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              // "Shorten your long URL quickly",
              "Shorten your long URL quickly",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            TextField(
              controller: state.urlController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
                filled: true,
                fillColor: Colors.grey[200],
                hintText: "Paste the Link",
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Builder(
              builder: (context) => GestureDetector(
                child: Text(state.shortUrlMessage),
                onTap: () {
                  Clipboard.setData(ClipboardData(text: state.shortUrlMessage))
                      .whenComplete(() => Scaffold.of(context).showSnackBar(
                      const SnackBar(content: Text("Link is copied"))));
                },
              ),
            ),
            const Spacer(),
            Container(
              width: double.infinity,
              child: FlatButton(
                onPressed: () {
                  state.handleGetLinkButton();
                },
                child: state.loading?CircularProgressIndicator(color: Colors.white,): const Text("GET LINK"),
                color: Colors.blue,
                textColor: Colors.white,
                padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}