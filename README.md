Nama: Muhammad Rafi Zia Ulhaq<br>
NPM: 2206814551<br>
Kelas: PBP B<br>
<hr>

1. Apa perbedaan utama antara *stateless* dan *stateful widget* dalam konteks pengembangan aplikasi Flutter?

   **Jawab:**

* **Stateless Widget**<br>
*Stateless widget* adalah *widget* yang tidak memiliki keadaan internal (*state*). Jenis *widget* ini tidak berubah dengan sendirinya melalui tindakan atau perilaku internal namun hanya bergantung pada tindakan yang diberikan dari luar. Ketika properti berubah, *Stateless widget* akan diberi tahu untuk me-*refresh* diri mereka sendiri dan merender ulang dengan data yang diperbarui. *Stateless widget* cocok untuk bagian-bagian UI yang hanya perlu merender data yang diberikan tanpa perlu menyimpan atau mengelola keadaan sendiri.
* **Stateful Widget**<br>
*Stateful widget* adalah *widget* yang memiliki keadaan internal (*state*). Jenis *widget* ini dapat menyimpan data dan keadaan aplikasi yang berubah, serta merespons perubahan ini dengan cara yang sesuai. Ketika keadaan internal berubah, *stateful widget* akan me-*refresh* diri mereka sendiri dan merender ulang dengan data yang diperbarui. *Stateful widget* cocok untuk bagian-bagian UI yang memerlukan pengelolaan keadaan, seperti formulir, *widget* interaktif, atau komponen yang memerlukan perubahan data *real-time*.

2. Sebutkan seluruh *widget* yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.

   **Jawab**

* **Widget MyApp**<br>
*Widget* ini merupakan *widget root* dari aplikasi. *Widget* ini langsung ditampilkan di layar dan menjadi titik awal dari seluruh tampilan dan berfungsi sebagai pengaturan utama dan kontrol pusat untuk aplikasi. *Widget* ini memiliki kegunaan seperti menginisialisasi aplikasi, menyediakan konteks (BuildContext), dan mengatur tema.
* **MyHomePage**<br>
Merupakan *widget* yang berguna untuk meletakkan nama app, serta menampilkan *widget-widget children* seperti `WeaponCard`.
* **WeaponCard**<br>
Merupakan *widget* yang berguna untuk meletakkan tombol "Lihat Item", "Tambah Item", dan "Logout".

3. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial)

   **Jawab**

* Generate proyek Flutter baru dengan nama **weapon_inventory**
```
flutter create weapon_inventory
cd weapon_inventory
```
* Membuat file baru bernama `menu.dart` pada direktori `weapon_inventory/lib`. Lalu menambahkan kode berikut pada baris pertama
```
import 'package:flutter/material.dart';
```
* Lalu menambah kode berikut pada file `main.dart`
```
import 'package:weapon_inventory/menu.dart';
```
* Hapus kode baris ke-39 hingga akhir yang berisi kedua class di ini:
```
class MyHomePage ... {
    ...
}

class _MyHomePageState ... {
    ...
}
```
* Mengubah warna tema aplikasi dan mengganti *background color* `appBar` pada file `main.dart` dengan kode berikut
```
colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF42faac)),
appBarTheme: const AppBarTheme(
   backgroundColor: Color(0xFF42faac),
),
```
* Menghapus `MyHomePage(title: 'Flutter Demo Home Page')` sehingga menjadi:
```
MyHomePage()
```
* Membuat widget MyHomePage di berkas `menu.dart`
```
class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final List<WeaponItem> items = [
    WeaponItem("Lihat Item", Icons.checklist, const Color(0xFF57C5B6)),
    WeaponItem("Tambah Item", Icons.add_circle_outline, const Color(0xFF159895)),
    WeaponItem("Logout", Icons.logout, const Color(0xFF1A5F7A)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weapon Inventory',
        ),
      ),
      body: SingleChildScrollView(
        // Widget wrapper yang dapat discroll
        child: Padding(
          padding: const EdgeInsets.all(10.0), // Set padding dari halaman
          child: Column(
            // Widget untuk menampilkan children secara vertikal
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                // Widget Text untuk menampilkan tulisan dengan alignment center dan style yang sesuai
                child: Text(
                  'Weapentory', // Text yang menandakan toko
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Grid layout
              GridView.count(
                // Container pada card kita.
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: items.map((WeaponItem item) {
                  // Iterasi untuk setiap item
                  return WeaponCard(item);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```
* Membuat *class* `WeaponItem` yang memiliki atribut `name`, `icon`, dan `color`
```
class WeaponItem {
  final String name;
  final IconData icon;
  final Color color;

  WeaponItem(this.name, this.icon, this.color);
}
```
* Membuat *widget* `WeaponCard` untuk menampilkan widget "Lihat Item", "Tambah Item", dan "Logout".
```
class WeaponCard extends StatelessWidget {
  final WeaponItem item;

  const WeaponCard(this.item, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color,
      child: InkWell(
        // Area responsive terhadap sentuhan
        onTap: () {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
        },
        child: Container(
          // Container untuk menyimpan Icon dan Text
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
```