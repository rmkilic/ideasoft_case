# ideasoft_test_case

Ideasoft Test Case:

## Getting Started

Test uygulaması olduğu için tema kullanımına gerek görmedim.

Uygulamaya ait renklerin bulunması için [https://imagecolorpicker.com/] kullanılmıştır.

Renklerin isimlendirilebilmesi için [https://colornamer.robertcooper.me/] kullanılmıştır

Favorilerin belirlenmesinde [State Management] (Riverpod) kullanılmıştır.

AspectRatio oranları kullanılan fotoğraf boyutlarına göre ölçeklenmiştir.

İmport edilen kütüphanelerin daha düzenli olabilmesi için Barrel file (index) kullanılmıştır.

Dosya Yapısı:
    [core] -> Proje bağımsız her projede kullanılabilecek yapıları barındırır.
        [constant] -> Sabitleri barındırır
        [extension] -> context extension barındırır kullanım kolaylığı sağlar.
    [model] -> API bağlantısı için gerekli olan modelleri tutar
    [provider] -> State management yöntemlerini tutar
    [service] -> API bağlantısını sağlar
    [view] ->UI katmanı
        [login] -> AdminMode ve UserMode switch
        [task1] -> HomeView
        [task2] -> Admin Mode
    [Product] -> Bu proje özelinde kullanılacak yapıları barındırır
        [Constant] -> Proje Bütünlüğünü sağlayabilmek için tanımlanan sabitleri tutar
        [Enum] -> Proje içerisinde kolay erişim sağlayabilmek için kullanılmaktadır.
        [Model] -> Sayfa içerisinde ihtiyaç duyulan class(modelleri) barındırır
        [Widget] -> Widgetları barındırır
        
