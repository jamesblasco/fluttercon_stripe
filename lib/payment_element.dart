import 'package:flutter/material.dart';
import 'package:fluttercon_stripe/stripe_js.dart' as js;
// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'dart:ui' as ui;

class PaymentElement extends StatefulWidget {
  const PaymentElement({
    Key? key,
  }) : super(key: key);

  @override
  PaymentElementState createState() => PaymentElementState();
}

class PaymentElementState extends State<PaymentElement> {
  // 2 is the first size generated by the iframe. O will not work
  double height = 2;

  js.PaymentElement? paymentElement;

  @override
  void initState() {
    final stripe = js.Stripe('pk_test_oDBTDWWrb1kezz6lwq9zmeoW00XmZlpvM6');
    final elements = stripe.elements(
      js.ElementsOptions(mode: 'payment', currency: 'eur', amount: 100),
    );
    paymentElement = elements.createPaymentElement();
    platformViewLoadObserver.observe(document, childList: true, subtree: true);
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      'stripe_payment_element',
      (int viewId) => _divElement,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: double.infinity, maxHeight: height),
      child: const HtmlElementView(viewType: 'stripe_payment_element'),
    );
  }

  late final DivElement _divElement = DivElement()
    ..id = 'payment-element'
    ..style.border = 'none'
    ..style.width = '100%'
    ..style.height = '$height';

  late MutationObserver platformViewLoadObserver =
      MutationObserver((entries, observer) {
    if (document.getElementById('payment-element') != null) {
      platformViewLoadObserver.disconnect();
      paymentElement?.mount('#payment-element');
      stripeElementLoadObserver.observe(document,
          childList: true, subtree: true);
    }
  });

  late final MutationObserver stripeElementLoadObserver =
      MutationObserver((entries, observer) {
    final stripeElements =
        document.getElementsByClassName('__PrivateStripeElement');
    if (stripeElements.isNotEmpty) {
      stripeElementLoadObserver.disconnect();
      final element = stripeElements.first as HtmlElement;
      resizeObserver.observe(element);
    }
  });

  late final resizeObserver = ResizeObserver((entries, observer) {
    for (final entry in entries) {
      if (entry.contentRect is DomRectReadOnly) {
        final cr = entry.contentRect;
        final height = cr.height;
        setState(() {
          this.height = height;
          _divElement.style.height = '${height}px';
        });
      }
    }
  });

  @override
  void dispose() {
    platformViewLoadObserver.disconnect();
    stripeElementLoadObserver.disconnect();
    resizeObserver.disconnect();
    paymentElement?.unmount();

    super.dispose();
  }
}
