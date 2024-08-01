import 'package:flutter/material.dart';


void main() {
  List<int> numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];
  List<int> primes = filterPrimes(numbers);
  print(primes); // Output: [2, 3, 5, 7, 11]
}

List<int> filterPrimes(List<int> numbers) {
  return numbers.where((num) => isPrime(num)).toList();
}

bool isPrime(int num) {
  if (num <= 1) return false; // 0 and 1 are not primes
  if (num <= 3) return true;  // 2 and 3 are primes
  if (num % 2 == 0 || num % 3 == 0) return false; // Check for multiples of 2 or 3

  for (int i = 5; i * i <= num; i += 6) {
    if (num % i == 0 || num % (i + 2) == 0) return false;
  }
  return true;
}
