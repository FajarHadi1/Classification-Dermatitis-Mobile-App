# 🩺 Classification Dermatitis Mobile App

![Flutter](https://img.shields.io/badge/Flutter-3.32.4-blue?logo=flutter)
![Python](https://img.shields.io/badge/Python-3.11.13-yellow?logo=python)
![TensorFlow](https://img.shields.io/badge/TensorFlow-2.19-orange?logo=tensorflow)

Aplikasi mobile untuk **klasifikasi penyakit kulit** menggunakan metode **Deep Learning**.  
User dapat mengunggah gambar kulit, lalu aplikasi akan memprediksi apakah gambar termasuk dalam salah satu dari empat kelas berikut:

- **Atopic Dermatitis**  
- **Allergic Contact Dermatitis**  
- **Seborrheic Dermatitis**  
- **Sehat (Normal)**  

Yang membuat proyek ini menarik adalah penggunaan **Derm Foundation**, sebuah model yang masih jarang digunakan untuk klasifikasi dermatologi, selain model populer **ResNet-50**.

---

## 🚀 Fitur Utama
- Aplikasi berbasis **Flutter** dengan antarmuka sederhana.  
- User dapat memilih model yang digunakan:
  - **ResNet-50** → model CNN populer untuk klasifikasi citra.  
  - **Derm Foundation** → model modern untuk analisis citra medis dermatologi.  
- Backend berbasis **Flask API**, dijalankan di Google Colab dengan bantuan **ngrok**.  
- Prediksi hasil klasifikasi langsung ditampilkan di aplikasi.

---

## 🛠️ Tech Stack
- **Frontend (Mobile):** Flutter (Dart)  
- **Backend (API):** Flask + ngrok (Colab)  
- **Machine Learning Models:** ResNet-50, Derm Foundation  
- **Deployment:** Google Colab (API), GitHub (kode sumber)

---

## 📂 Struktur Folder
```

Classification-Dermatitis-Mobile-App/
│── Application/          
│── API_Flask.ipynb       
│── README.md             \

````
---
## 🗂️ Model Deep Learning
Download model dibawah:
- Resnet-50 : https://drive.google.com/file/d/1bCpNu51jpsXP1fRx6K67mRFSN5HDNRFN/view?usp=drive_link
- Derm Foundation : https://drive.google.com/file/d/1g6ez5_G__yuKsNNpOTFCCGPWTpKorFxA/view?usp=drive_link

---

## 🔧 Cara Menjalankan

### 1. Backend (Flask API di Colab)
1. Buka file `API_Flask.ipynb` di Google Colab.
2. Import resnet.h5 dan derm.h5  
3. Jalankan seluruh cell untuk mengaktifkan Flask API dengan ngrok.  
4. Catat URL ngrok yang dihasilkan → ini yang akan dipakai aplikasi Flutter.  
5. Tulis nilai variabel `baseUrl` dengan URL tersebut pada:  
   - `Application/lib/core/api/api_client.dart`  
   - `Application/lib/data/services/image_api_service.dart`

### 2. Frontend (Flutter App)
```bash
cd Application
flutter pub get
flutter run
````

Pastikan URL API pada kode Flutter sesuai dengan link ngrok yang aktif.

---

## 📊 Model yang Digunakan

* **ResNet-50**
  Model CNN (Convolutional Neural Network) dengan 50 layer, populer untuk klasifikasi citra. Cocok untuk baseline karena stabil dan banyak digunakan di penelitian.

* **Derm Foundation**
  Model berbasis *foundation model* yang dilatih khusus untuk data dermatologi. Memberikan hasil yang lebih spesifik untuk kasus medis, namun masih jarang digunakan sehingga menjadi nilai unik pada proyek ini.

---

## 📈 Hasil Evaluasi Model

* **ResNet-50**

  * Training Accuracy: 95%
  * Validation Accuracy: 86%
  * Test Accuracy: 96%

* **Derm Foundation**

  * Training Accuracy: 98%
  * Validation Accuracy: 83%
  * Test Accuracy: 81%

---

## 📸 Preview

<p align="left">
  <img src="https://github.com/user-attachments/assets/96fc88dd-14d1-4802-a336-7e07cdb63714" alt="Preview 1" width="220"/>
  <img src="https://github.com/user-attachments/assets/16cc8c9d-da47-4060-965d-7f4550e12e4b" alt="Preview 2" width="220"/>
</p>

---

## 🤝 Kontribusi

Pull request dan diskusi terbuka. Untuk perubahan besar, silakan buka issue terlebih dahulu.

---

## 📜 Lisensi

MIT License © 2025 Fajar Hadi

```
