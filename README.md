Nama: Muhammad Rafi Zia Ulhaq<br>
NPM: 2206814551<br>
Kelas: PBP B<br>
<hr>

1. Jelaskan perbedaan antara `Navigator.push()` dan `Navigator.pushReplacement()`, disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!

   **Jawab:**

* `Navigator.push()`<br>
  Method `Navigator.push()` akan menambahkan route baru diatas route yang sudah ada pada atas stack. Contoh:
  ```
  import 'package:flutter/material.dart';

  void main() => runApp(MyApp());

  class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        home: FirstPage(),
      );
    }
  }

  class FirstPage extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('First Page'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SecondPage()),
              );
            },
            child: Text('Go to Second Page'),
          ),
        ),
      );
    }
  }

  class SecondPage extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Second Page'),
        ),
        body: Center(
          child: Text('This is the Second Page'),
        ),
      );
    }
  }
  ```
  FirstPage adalah halaman pertama yang menampilkan tombol. Saat tombol ditekan, kita menggunakan Navigator.push() untuk memulai transisi ke SecondPage. Setelah transisi, SecondPage akan ditambahkan ke tumpukan navigasi di atas FirstPage. Jadi, ketika pengguna menekan tombol "kembali" di SecondPage, mereka akan kembali ke FirstPage.

* `Navigator.pushReplacement()`<br>
  Method `Navigator.pushReplacement()` akan menggantikan route yang sudah ada pada atas stack dengan route baru tersebut. Hal ini bermanfaat ketika Anda ingin mengganti halaman saat ini dengan halaman baru dan menghapus halaman sebelumnya dari tumpukan. Contoh:
  ```
  import 'package:flutter/material.dart';

  void main() => runApp(MyApp());

  class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        home: FirstPage(),
      );
    }
  }

  class FirstPage extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('First Page'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => SecondPage()),
              );
            },
            child: Text('Go to Second Page (replace)'),
          ),
        ),
      );
    }
  }

  class SecondPage extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Second Page'),
        ),
        body: Center(
          child: Text('This is the Second Page'),
        ),
      );
    }
  }
  ```
  Saat tombol ditekan di FirstPage, kita menggunakan `Navigator.pushReplacement()` untuk menggantikan FirstPage dengan SecondPage dalam tumpukan navigasi. Sehingga, jika pengguna menekan tombol kembali di SecondPage, mereka tidak akan kembali ke FirstPage, tetapi keluar dari aplikasi (karena FirstPage telah digantikan).

2. Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing!

   **Jawab**

* **Container**<br>
  Container adalah widget serbaguna yang dapat digunakan untuk mengatur dan mendekorasi child widget. Widget ini dapat berfungsi sebagai wadah untuk widget lain atau sebagai widget tata letak sendiri.
* **Column**<br>
  Column menyusun widget-child secara vertikal. Digunakan ketika ingin menempatkan widget di dalam kolom secara berurutan dari atas ke bawah.
* **Row**<br>
  Row menyusun widget-child secara horizontal. Digunakan ketika ingin menempatkan widget di dalam baris secara berurutan dari kiri ke kanan.
* **Stack**<br>
  Stack memungkinkan penumpukan widget di atas satu sama lain. Widget di bagian atas menutupi widget di bawahnya.
* **ListView**<br>
  ListView digunakan untuk menampilkan daftar widget secara bergulir. Berguna ketika memiliki daftar item yang lebih besar daripada yang dapat ditampilkan pada layar sekaligus.
* **GridView**<br>
  GridView mengatur widget dalam bentuk grid dengan baris dan kolom. Cocok untuk menampilkan data dalam format grid.
* **SizedBox**<br>
  SizedBox digunakan untuk memberikan dimensi tertentu (lebar, tinggi) pada child widget.
* **Expanded**<br>
  Expanded mengisi sebanyak mungkin ruang yang tersedia di dalam parent widget, misalnya dalam Column atau Row, untuk memberikan widget-child lebih banyak ruang.

3. Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!

   **Jawab**

  Pada tugas kali ini saya menggunakan 6 elemen input yaitu `name`, `type`, `atk`, `rarity`, `description`, dan `amount` yang masing-masing diinput menggunakan `TextFormField`, saya menggunakan `TextFormField` dikarenakan 6 elemen input tadi merupakan sebuah input berbentuk teks.

4. Bagaimana penerapan *clean architecture* pada aplikasi Flutter?

   **Jawab**

  *Clean Architecture* adalah suatu pendekatan pengembangan perangkat lunak yang bertujuan untuk memisahkan dan mengorganisir kode secara bersih dan terstruktur, dengan tujuan utama untuk mempermudah pemeliharaan, pengujian, dan skalabilitas aplikasi. Pada dasarnya, *Clean Architecture* terdiri dari tiga lapisan utama: *Domain Layer*, *Data Layer*, dan *Presentation Layer*.
* *Domain Layer*: Lapisan *domain* mewakili logika bisnis inti aplikasi. Lapisan ini berisi kasus penggunaan, entitas, dan aturan bisnis. Kasus penggunaan menentukan operasi atau tindakan yang dapat dilakukan dalam aplikasi. Entitas mewakili objek penting dalam *domain* dan merangkum perilaku dan keadaannya. Lapisan *domain* harus agnostik terhadap *frameworks* atau teknologi tertentu.
* *Data Layer*: Lapisan data bertanggung jawab untuk pengambilan dan penyimpanan data. Ini terdiri dari repositori dan sumber data. Repositori menyediakan lapisan abstraksi untuk mengakses dan memanipulasi data. Repositori menentukan kontrak atau antarmuka untuk operasi data, yang diterapkan oleh sumber data. Sumber data dapat berupa API jarak jauh, *database* lokal, atau penyedia data eksternal lainnya. Lapisan data melindungi lapisan *domain* dari detail penyimpanan dan pengambilan data.
* *Presentation Layer*: Lapisan ini berisi komponen antarmuka pengguna, seperti widget, layar, dan tampilan. Lapisan ini bertanggung jawab untuk menangani interaksi pengguna dan merender UI. Lapisan presentasi harus independen terhadap logika bisnis dan detail implementasi akses data.

  Petunjuk penerapan *clean architecture*:
* *Domain Layer* tidak bergantung pada lapisan lainnya: Lapisan *domain* berisi logika bisnis inti dan tidak boleh memiliki ketergantungan apa pun pada *frameworks* eksternal, *libraries*, atau komponen terkait UI. Hal ini membuat lapisan *domain* dapat digunakan kembali dan tidak bergantung pada *platform*.
* *Data Layer* bergantung pada lapisan *Domain*: Lapisan data mengimplementasikan antarmuka atau abstraksi yang ditentukan dalam lapisan *domain*. Hal ini memungkinkan sumber data yang berbeda (misalnya API, *database*) untuk dicolokkan ke dalam aplikasi tanpa mempengaruhi lapisan *domain*.
* *Presentation Layer* bergantung pada lapisan *Domain*: Lapisan presentasi berinteraksi dengan lapisan *domain* melalui antarmuka atau abstraksi yang disediakan oleh lapisan *domain*. Hal ini memungkinkan logika bisnis dipisahkan dari lapisan presentasi.
  
5. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial)

   **Jawab**

* Membuat berkas baru di dalam direktori baru `widgets` dengan nama `left_drawer.dart`. Lalu menambahkan kode yang sama seperti di tutorial ke dalam berkas `left_drawer.dart` namun mengganti kode
  ```
  Text("Catat seluruh keperluan belanjamu di sini!",
    // TODO: Tambahkan gaya teks dengan center alignment, font ukuran 15, warna putih, dan weight biasa
  ),
  ```
  menjadi
  ```
  Text("Simpan seluruh senjatamu di sini!",
    textAlign: TextAlign.center,
    style: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.normal,
      color: Colors.black,
    ),
  ),
  ```
  untuk mengganti teks dan formatnya.
* Selanjutnya masukkan drawer tersebut ke halaman yang memerlukan drawer sesuai dengan di tutorial.
* Membuat berkas baru pada direktori `lib` dengan nama `weaponlist_form.dart`. Lalu menambahkan kode berikut ke dalam berkas `weaponlist_form.dart`.
  ```
  import 'package:flutter/material.dart';
  import 'package:weapon_inventory/widgets/left_drawer.dart';

  class WeaponFormPage extends StatefulWidget {
      const WeaponFormPage({super.key});

      @override
      State<WeaponFormPage> createState() => _WeaponFormPageState();
  }

  class _WeaponFormPageState extends State<WeaponFormPage> {
      @override
      Widget build(BuildContext context) {
          return Placeholder();
      }
  }
  ```
* Mengubah widget `Placeholder` dengan potongan kode berikut.
  ```
  Scaffold(
    appBar: AppBar(
      title: const Center(
        child: Text(
          'Form Tambah Item',
        ),
      ),
      backgroundColor: const Color(0xFF42faac),
      foregroundColor: Colors.black,
    ),
    drawer: const LeftDrawer(),
    body: Form(
      child: SingleChildScrollView(),
    ),
  );
  ```
* Membuat variabel baru bernama _formKey lalu tambahkan _formKey tersebut ke dalam atribut key milik widget Form.
  ```
  class _WeaponFormPageState extends State<WeaponFormPage> {
    final _formKey = GlobalKey<FormState>();
  }
  ```
  ```
  body: Form(
      key: _formKey,
      child: SingleChildScrollView(),
  ),
  ```
* Membuat beberapa variabel untuk menyimpan input dari masing-masing field yang akan dibuat.
  ```
  class _WeaponFormPageState extends State<WeaponFormPage> {
    final _formKey = GlobalKey<FormState>();
    String _name = "";
    String _type = "";
    int _atk = 0;
    String _rarity = "";
    String _description = "";
    int _amount = 0;
  }
  ```
* Membuat widget Column sebagai child dari SingleChildScrollView.
  ```
  body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column()
        ),
      )
  ```
* Membuatlah widget `TextFormField` yang dibungkus oleh Padding sebagai salah satu children dari widget Column. Setelah itu, tambahkan atribut crossAxisAlignment untuk mengatur alignment children dari Column.
  ```
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          decoration: InputDecoration(
            hintText: "Nama Item",
            labelText: "Nama Item",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
          onChanged: (String? value) {
            setState(() {
              _name = value!;
            });
          },
          validator: (String? value) {
            if (value == null || value.isEmpty) {
              return "Nama tidak boleh kosong!";
            }
            return null;
          },
        ),
      ),
    ]
  )
  ```
* Membuat dua TextFormField yang dibungkus dengan Padding sebagai child selanjutnya dari Column seperti sebelumnya untuk field `type`, `atk`, `rarity`, `description`, dan `amount`.
* Membuat tombol sebagai child selanjutnya dari Column. Lalu membungkus tombol ke dalam widget Padding dan Align.
  ```
  Align(
    alignment: Alignment.bottomCenter,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(const Color(0xFF42faac)),
        ),
        onPressed: () {
          if (_formKey.currentState!.validate()) {}
        },
        child: const Text(
          "Save",
          style: TextStyle(color: Colors.white),
        ),
      ),
    ),
  ),
  ```
* Menambahkan fungsi showDialog() pada bagian onPressed() dan munculkan widget AlertDialog pada fungsi tersebut sesuai dengan tutorial. Kemudian, tambahkan juga fungsi untuk reset form. Lalu mengganti TODO untuk menampilkan value-value lain.
  ```
  Text('Type: $_type'),
  Text('ATK: $_atk'),
  Text('Rarity: $_rarity'),
  Text('Deskripsi: $_description'),
  Text('Jumlah: $_amount'),
  ```
* Membuat agar kode yang terletak pada atribut onTap dari InkWell dapat melakukan navigasi ke route lain pada widget ShopItem pada berkas menu.dart.
  ```
  // Area responsif terhadap sentuhan
  onTap: () {
    // Memunculkan SnackBar ketika diklik
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(
          content: Text("Kamu telah menekan tombol ${item.name}!")));

    // Navigate ke route yang sesuai (tergantung jenis tombol)
    if (item.name == "Tambah Item") {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const WeaponFormPage()));
    }
  },
  ```
* Melakukan *refactoring* sesuai dengan tutorial.