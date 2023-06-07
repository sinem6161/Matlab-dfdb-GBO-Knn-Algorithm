clear all
clc
global VERI;

Verileri_Oku('vehicle');

egitim_seti=VERI.egitim_seti;
test_seti=VERI.test_seti;

komsu_sayisi=7;
esik=0.3;

[hata]=Knn(egitim_seti,test_seti,komsu_sayisi);
[agirliklar,performans]=dfdb_GBO_Case1(egitim_seti,test_seti,komsu_sayisi);
[knn_performans,sayac,egitim_seti,test_seti]=ozellik_cikarimi(agirliklar,egitim_seti,test_seti,komsu_sayisi,esik);

disp(size(egitim_seti));