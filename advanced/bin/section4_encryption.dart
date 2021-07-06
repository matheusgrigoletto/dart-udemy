import 'dart:typed_data';
import 'dart:convert';
import 'dart:math';
import 'package:collection/collection.dart';
import 'package:pointycastle/pointycastle.dart';

void main() {
  //lesson1_hashes();
  //lesson2_deriving_keys();
  //lesson3_secure_random_numbers();
  //lesson4_stream_ciphers();
  //lesson5_block_ciphers();
  lesson6_assignment();
}

void lesson1_hashes() {
  var digest = Digest('SHA-256');

  var value = 'Hello World';

  var data = Uint8List.fromList(utf8.encode(value));
  var hash = digest.process(data);

  print(hash);
  print(base64.encode(hash)); // ENCODING IS NOT ENCRYPTION!
}

void lesson2_deriving_keys() {
  void display(String title, Uint8List value) {
    print(title);
    print(value);
    print(base64.encode(value));
    print('');
  }

  var password = 'password';

  var salt = createUint8ListFromString('salt');
  var pkcs = KeyDerivator('SHA-1/HMAC/PBKDF2');
  var params = Pbkdf2Parameters(salt, 100, 16);

  pkcs.init(params);

  var key = pkcs.process(createUint8ListFromString(password));

  display('Key value', key);
}

void lesson3_secure_random_numbers() {
  Uint8List randomBytes(int length) {
    final rnd = SecureRandom('AES/CTR/AUTO-SEED-PRNG');

    final key = Uint8List(16);
    final keyParam = KeyParameter(key);
    final params = ParametersWithIV(keyParam, Uint8List(16));

    rnd.seed(params);

    var random = Random();
    for(num i = 0; i < random.nextInt(255); i++) {
      rnd.nextUint8();
    }

    var bytes = rnd.nextBytes(length);
    return bytes;
  }

  print(randomBytes(16));
}

void lesson4_stream_ciphers() {
  final keybytes = randomBytes(16);
  final key = KeyParameter(keybytes);

  final iv = randomBytes(8);
  final params = ParametersWithIV(key, iv);

  var cipher = StreamCipher('Salsa20');
  cipher.init(true, params);

  // Encrypt
  var plaintext = 'Hello World';
  var plain_data = createUint8ListFromString(plaintext);
  var encrypted_data = cipher.process(plain_data);

  // Decrypt
  cipher.reset();
  cipher.init(false, params);
  var decrypted_data = cipher.process(encrypted_data);

  displayUint8List('Plain text', plain_data);
  displayUint8List('Encrypted Data', encrypted_data);
  displayUint8List('Decrypted Data', decrypted_data);

  // Make sure they match!
  Function eq = const ListEquality().equals;
  assert(eq(plain_data,decrypted_data));

  print(utf8.decode(decrypted_data));
}

void lesson5_block_ciphers() {
  final key = randomBytes(16);
  final params = KeyParameter(key);

  var cipher = BlockCipher('AES');
  cipher.init(true, params);

  // Encrypt
  var plaintext = 'Hello World';
  var plain_data = createUint8ListFromString(plaintext.padRight(cipher.blockSize)); // PAD - NOT 100% secure
  var encrypted_data = cipher.process(plain_data);

  // Decrypt
  cipher.reset();
  cipher.init(false, params);
  var decrypted_data = cipher.process(encrypted_data);

  displayUint8List('Plain text', plain_data);
  displayUint8List('Encrypted data', encrypted_data);
  displayUint8List('Decrypted data', decrypted_data);

  // Make sure they match
  Function eq = const ListEquality().equals;
  assert(eq(plain_data,decrypted_data));

  print(utf8.decode(decrypted_data).trim());
}

void lesson6_assignment() {
  final keyBytes = randomBytes(16);
  final key = KeyParameter(keyBytes);
  final iv = randomBytes(8);
  final params = ParametersWithIV(key, iv);

  var cipher = StreamCipher('Salsa20');
  cipher.init(true, params);

  var plain_text = createUint8ListFromString('Hello World');
  var encrypted_data = cipher.process(plain_text);

  cipher.reset();
  cipher.init(false, params);

  var decrypted_data = cipher.process(encrypted_data);

  var digest = Digest('SHA-256');
  assert(base64.encode(digest.process(plain_text)) == base64.encode(digest.process(decrypted_data)));

  print('it works');
}

// -----------------------------------------------------------------------------

// From tutorial 2
Uint8List createUint8ListFromString(String value)
  => Uint8List.fromList(utf8.encode(value));

// From tutorial 2
void displayUint8List(String title, Uint8List value) {
  print(title);
  print(value);
  print(base64.encode(value));
  print('');
}

// From Tutorial 3
Uint8List randomBytes(int length) {
  final rnd = SecureRandom('AES/CTR/AUTO-SEED-PRNG');

  final key = Uint8List(16);
  final keyParam = KeyParameter(key);
  final params = ParametersWithIV(keyParam, Uint8List(16));

  rnd.seed(params);
  var random = Random();
  for(num i = 0; i < random.nextInt(255); i++) {
    rnd.nextUint8();
  }

  var bytes = rnd.nextBytes(length);
  return bytes;
}