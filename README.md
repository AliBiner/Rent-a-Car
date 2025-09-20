### Bitirme Projesi Konusu (Araç Kiralama Uygulaması)

# Araç Kiralama Sistemi

Bu projeyle, modern yazılım geliştirme prensiplerini merkeze alarak terminal tabanlı menülü bir araç kiralama uygulaması geliştireceksiniz. Mimarimizin temelinde, uygulamanın her bir katmanının belirli bir sorumluluğu üstlendiği, esneklik, ölçeklenebilirlik ve bakım kolaylığı sunan katmanlı mimari yaklaşımı olacaktır.

Bu geliştirme süreci boyunca, Java ile katmanlı mimarinin inceliklerini, veritabanı işlemlerini etkin bir şekilde yönetmeyi ve kullanıcı akışlarını mantıksal bir düzen içinde inşa etme becerisini kazanacaksınız.

### Fonksiyonel Gereksinimler

- Kimlik Doğrulama

  - Giriş/Kayıt: E-posta + şifre ile yapılmalıdır. ✅

  - Parolalar SHA-256 veya benzeri bir algoritma ile hash’lenerek saklanmalıdır. ✅

- Roller ve Yetkilendirme
    
  - Role: Admin, Customer ✅
  
  - Customer Type =  Individual, Institutional ✅
  
  - ADMIN: Araç ekleme/güncelleme/silme/listeleme işlemleri (CRUD).

  - CUSTOMER (Bireysel/Kurumsal): Araç arama, Kiralama, İptal işlemleri.

  - Sadece giriş yapmış kullanıcılar kiralama başlatabilir.

- Araçlar ve Ücretlendirme

  - Araç tipleri: Otomobil, Helikopter, Motosiklet.

  - Araç tipleri ortak bir contract (interface/abstract class) ile modellenmeli, arama, fiyatlandırma ve kiralama akışları mevcut kodu bozmadan genişletilebilir olmalıdır.

  - Her araç sınıfı için ayrı fiyat tarifesi.

  - Saatlik / Günlük / Haftalık / Aylık kiralama ve süreye göre ücret hesaplama.

- Arama, Filtre, Sayfalama

  - Tip, marka, fiyat aralığı ile filtreleme.

  - Sayfalama (pagination) sağlanmalıdır.

- İş Kuralları

  - Kurumsal hesaplar en az 1 ay kiralama yapabilir.

  - Araç değeri > 2.000.000 TL ise: kiralayan için ≥ 30 yaş ve %10 depozito verme şartı.

- Uygunluk Kontrolü

  - Seçilen tarih/saat aralığında çakışan kiralamalar engellenir.

- Kiralama Kaydı

  - Kullanıcılar, güncel ve geçmiş kiralamalarını görüntüleyebilmelidir.

  - Depozito Yaşam Döngüsü

  - Depozito hesaplanır ve kaydedilir; iptal/tamamlama akışlarında iade/mahsup doğru yönetilir.

- Hata Mesajları

  - Başarılı durumlar ve hatalı durumlar için anlaşılır ve kullanıcı odaklı konsol mesajları gösterilmelidir.

---

### Teknik Gereksinimler

- Platform ve Bağımlılıklar

  - Java 21, PostgreSQL (tercihen 16), JDBC (Maven ile yönetilebilir veya sürücü dosyası proje dizinine yerleştirilebilir).

- Veri Modeli ve SQL

  - İlişkili tabloların doğru tasarımı; doğru ve verimli JOIN kullanımı.

- Transaction Yönetimi

  - Kiralama oluşturma / iptal / depozito güncelleme adımları tek transaction içinde (atomicity) yürütülmeli, commit/rollback kuralları doğru uygulanmalı ve depozito hesaplama, iade ve mahsup bu kapsamda tutarlı yönetilmelidir.

- Seed Verisi

  - Başlangıç verisi: 3 kullanıcı (ADMIN / CORPORATE / INDIVIDUAL) ve en az 6 araç.

- Exception Yönetimi

  - Beklenen (ör. geçersiz kullanıcı girdisi) ve beklenmeyen (ör. veritabanı bağlantı kopması) hatalar uygun şekilde yakalanmalı ve yönetilmelidir.

- Mimari ve Kod Kalitesi

  - Katmanlı mimari uygulanmalıdır (ör. DAO/Repository, Service, Model/Entity, Main, UI).

  - Kod okunabilirliği, düzeni ve girintiler tutarlı ve temiz tutulmalıdır.

  - Class, değişken, metod gibi isimlendirmeler Java standartlarında ve İngilizce olmalıdır.

  - Açıklayıcı yorumlar ve projeyi özetleyen bir README bulunmalıdır.