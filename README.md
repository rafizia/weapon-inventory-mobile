Nama: Muhammad Rafi Zia Ulhaq<br>
NPM: 2206814551<br>
Kelas: PBP B<br>
<hr>

1. Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?

  **Jawab:**

  Ya, kita dapat melakukan pengambilan data JSON tanpa membuat model terlebih dahulu dengan menggunakan konsep dinamis atau map di Dart. Dart menyediakan tipe data Map<String, dynamic> yang dapat digunakan untuk mengakses dan membaca data JSON tanpa membuat model terlebih dahulu. Namun terdapat beberapa kekurangan seperti ketika struktur data berubah, kita harus secara manual memperbarui kode yang menggunakan data tersebut. Dengan model, jika struktur data berubah, kita hanya perlu memperbarui modelnya.

2. Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.

  **Jawab**

  Fungsi utama dari CookieRequest adalah untuk menyimpan cookie yang dikirimkan oleh server ke aplikasi Flutter. Cookie dapat digunakan oleh aplikasi untuk melakukan autentikasi atau menyimpan data sesi. Instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter agar semua komponen dapat mengakses cookie yang tersimpan. Hal ini penting untuk aplikasi yang membutuhkan cookie untuk berfungsi.

3. Jelaskan mekanisme pengambilan data dari JSON hingga dapat ditampilkan pada Flutter.

  **Jawab**

  Mekanisme pengambilan data dari JSON hingga ditampilkan pada Flutter yaitu:
  * Membuat model data yang sesuai dengan format JSON yang akan diambil. Model data ini akan mewakili data JSON yang akan ditampilkan.
  * Menggunakan HTTP untuk melakukan permintaan ke API atau sumber data JSON dan mendapatkan respons.
  * Menggunakan widget Flutter untuk menampilkan data yang diambil ke dalam antarmuka pengguna.

4. Jelaskan mekanisme autentikasi dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.

  **Jawab**

  * Pengguna menginput data akunnya, seperti username dan password, pada Flutter. Data akun ini kemudian akan dikirimkan ke Django.
  * Django akan menerima data akun dari Flutter dan melakukan proses autentikasi. Proses autentikasi ini meliputi pengecekan apakah username dan password yang dimasukkan pengguna terdapat di database. Jika username dan password yang dimasukkan pengguna terdapat di database, maka Django akan mengembalikan token autentikasi. Token autentikasi ini kemudian akan dikirimkan kembali ke Flutter.
  * Flutter akan memeriksa token autentikasi yang diterimanya. Jika token autentikasi valid, maka Flutter akan menampilkan menu.

5. Sebutkan seluruh widget yang kamu pakai pada tugas ini dan jelaskan fungsinya masing-masing.

  **Jawab**

  * **Widget MyApp**<br>
  *Widget* ini merupakan *widget root* dari aplikasi. *Widget* ini langsung ditampilkan di layar dan menjadi titik awal dari seluruh tampilan dan berfungsi sebagai pengaturan utama dan kontrol pusat untuk aplikasi. *Widget* ini memiliki kegunaan seperti menginisialisasi aplikasi, menyediakan konteks (BuildContext), dan mengatur tema.
  * **MyHomePage**<br>
  Merupakan *widget* yang berguna untuk meletakkan nama app, serta menampilkan *widget-widget children* seperti `WeaponCard`.
  * **WeaponCard**<br>
  Merupakan *widget* yang berguna untuk meletakkan tombol "Lihat Item", "Tambah Item", dan "Logout".
  * **LeftDrawer**<br>
  Merupakan *widget* yang berguna untuk menyimpan menu navigasi berupa sebuah drawer yang dapat diakses di sebelah kiri aplikasi oleh pengguna.
  * **WeaponFormPage**<br>
  Merupakan *widget* yang berguna sebagai formulir untuk pengguna memasukkan data input seperti nama, type, atk, dan data-data lainnya.
  * **LoginApp dan LoginPage**<br>
  Merupakan *widget* yang berguna sebagai halaman login pengguna untuk masuk ke dalam aplikasi.
  * **ItemPage**<br>
  Merupakan *widget* yang berguna untuk menampilkan data-data item yang telah dimasukkan pengguna.
  
6. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial)

   **Jawab**

  * Membuat django-app bernama authentication pada project Django. Lalu menambahkan authentication ke INSTALLED_APPS di settings.py.
  * Menjalankan perintah pip install django-cors-headers untuk menginstal library yang dibutuhkan.
  * Menambah corsheaders ke INSTALLED_APPS pada main project settings.py.
  * Menambah corsheaders.middleware.CorsMiddleware pada main project settings.py.
  * Menambah beberapa variabel berikut ini pada main project settings.py.
    ```
    CORS_ALLOW_ALL_ORIGINS = True
    CORS_ALLOW_CREDENTIALS = True
    CSRF_COOKIE_SECURE = True
    SESSION_COOKIE_SECURE = True
    CSRF_COOKIE_SAMESITE = 'None'
    SESSION_COOKIE_SAMESITE = 'None'
    ```
  * Membuat sebuah metode view untuk login pada authentication/views.py seperti di tutorial.
  * Membuat file urls.py pada folder authentication dan menambah URL routing terhadap fungsi yang sudah dibuat dengan endpoint login/.
  * Menginstall package dengan perintah berikut
    ```
    flutter pub add provider
    flutter pub add pbp_django_auth
    ```
  * Memodifikasi root widget untuk menyediakan CookieRequest library ke semua child widgets dengan menggunakan Provider seperti di tutorial.
  * Membuat file baru pada folder screens dengan nama login.dart dan mengisi file tersebut seperti di tutorial.
  * Mengubah home: MyHomePage() menjadi home: LoginPage() pada file main.dart.
  * Membuat model custom dengan Quicktype, lalu memasukkan kode tersebut pada file item.dart.
  * Menjalankan perintah flutter pub add http pada terminal proyek Flutter untuk menambahkan package http.
  * Menambahkan kode berikut pada file android/app/src/main/AndroidManifest.xml.
    ```
    <uses-permission android:name="android.permission.INTERNET" />
    ```
  * Membuat file baru pada folder lib/screens dengan nama list_item.dart kemudian impor library yang dibutuhkan.
  * Menambah kode yang sama seperti di tutorial dan mengganti URL menjadi url aplikasi Weapentory (sementara localhost).
  * Menambah halaman list_item.dart ke widgets/left_drawer.dart.
  * Mengubah fungsi tombol Lihat Item pada halaman utama agar mengarahkan ke halaman ItemPage.
    ```
    else if (item.name == "Lihat Item") {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ItemPage()));
          }
    ```
  * Membuat fungsi baru pada main/views.py dengan potongan kode seperti di tutorial lalu menambahkan pathnya.
  * Menghubungkan halaman weaponlist_form.dart dengan CookieRequest dengan menambahkan baris kode berikut.
    ```
    final request = context.watch<CookieRequest>();
    ```
  * Mengubah perintah pada onPressed: () button tambah menjadi kode yang sama seperti di tutorial namun dengan mengganti URL ke URL aplikasi Weapentory dan menyesuaikan field data menjadi name, atk, type, rarity, description, dan amount.
  * Membuat sebuah metode view untuk logout pada authentication/views.py lalu menambah pathnya seperti di tutorial.
  * Membuka file lib/widgets/weapon_card.dart dan tambahkan potongan kode berikut.
    ```
    final request = context.watch<CookieRequest>();
    ```
  * Mengubah perintah onTap: () {...} pada widget Inkwell menjadi onTap: () async {...}.
  * Menambah kode yang sama seperti di tutorial ke dalam async {...} namun dengan mengganti URL ke URL aplikasi Weapentory. 

