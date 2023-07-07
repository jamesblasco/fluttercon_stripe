import 'package:js/js.dart';

@JS()
@staticInterop
class Stripe {
  external factory Stripe(String publishableKey);
}

extension StripeX on Stripe {
  external Elements elements(ElementsOptions options);
}

@JS()
@staticInterop
@anonymous
class ElementsOptions {
  external factory ElementsOptions({String mode, String currency, int amount});
}

@JS()
@staticInterop
class Elements {}

extension on Elements {
  external dynamic create(String type);
}

extension ElementsX on Elements {
  PaymentElement createPaymentElement() {
    return create('payment');
  }
}

@JS()
@staticInterop
class PaymentElement {}

extension PaymentElementX on PaymentElement {
  external void mount(String id);
  external void unmount();
}
