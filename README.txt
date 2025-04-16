BackEnd Tutorial
1. Tahap Debuging Production
    a. Gunakan virtual environment python untuk melakukan debuging, bisa diikuti cara ini untuk set up env melalui link "https://docs.python.org/3/library/venv.html". atau kalau sudah ada bisa di
    b. Setelah itu jangan lupa aktifkan virtual env yang telah di set, lalu unduh dependencies yang sesuai dan kompatibel dengan inisialisasi projek ini yaitu
        I. django 
        II. djangorestframework 
        III. django-cors-headers 
        IV. djangorestframework-simplejwt
	V. Pillow
    note : shortcut "pip install django djangorestframework django-cors-headers djangorestframework-simplejwt Pillow"
    c. Kemudian, buka path backend/ untuk melakukan inisialisasi projek dengan menjalankan "python manage.py runserver"
2. Kategorisasi App BackEnd
    a. App api adalah keseluruhan
    b. App authentication khusus untuk membuat user dan authentikasi djoser