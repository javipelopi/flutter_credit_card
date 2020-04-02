/// Checks the number to see if it is valid

bool luhnCheck(String cardNumber) {
  if (cardNumber == null) {
    return false;
  }
  final String editedCardNumber = cardNumber.replaceAll(RegExp(r'\D'), '');
  if (editedCardNumber.isEmpty) {
    return false;
  }
  final int checkDigit =
      int.parse(editedCardNumber[editedCardNumber.length - 1]);
  final String digit = calculateCheckDigit(
      editedCardNumber.substring(0, editedCardNumber.length - 1));
  return checkDigit == int.parse(digit[0]);
}

/// Calculates the last digits for the card number received as parameter

String calculateCheckDigit(String card) {
  if (card == null) {
    return null;
  }
  String digit;
  /* convert to array of int for simplicity */
  List<int> digits = List<int>(card.length);
  for (int i = 0; i < card.length; i++) {
    digits[i] = int.parse(card[i]);
  }

  /* double every other starting from right - jumping from 2 in 2 */
  for (int i = digits.length - 1; i >= 0; i -= 2) {
    digits[i] += digits[i];

    /* taking the sum of digits grater than 10 - simple trick by substract 9 */
    if (digits[i] >= 10) {
      digits[i] = digits[i] - 9;
    }
  }
  int sum = 0;
  for (int i = 0; i < digits.length; i++) {
    sum += digits[i];
  }
  /* multiply by 9 step */
  sum = sum * 9;

  /* convert to string to be easier to take the last digit */
  digit = sum.toString();
  return digit.substring(digit.length - 1);
}
