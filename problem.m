function hata = problem(agirlik,egitim_seti,test_seti,komsu_sayisi)


global VERI;
global SINIF_SAYISI;

[egitim_ornek_sayisi,nitelik_sayisi]=size(egitim_seti);
[test_ornek_sayisi,~] =size(test_seti);

uzaklik_dizisi=zeros(egitim_ornek_sayisi,test_ornek_sayisi);

for i=1:egitim_ornek_sayisi
    for j=1:test_ornek_sayisi
        for k=1:nitelik_sayisi
            uzaklik_dizisi(i,j)=uzaklik_dizisi(i,j)+(agirlik(k)*(egitim_seti(i,k)-test_seti(j,k))^2);
        end
        uzaklik_dizisi(i,j)=sqrt(uzaklik_dizisi(i,j));
    end
end

sirali_uzaklik=zeros(egitim_ornek_sayisi,test_ornek_sayisi);
sirali_indeks=zeros(egitim_ornek_sayisi,test_ornek_sayisi);
test_etiketi=zeros(test_ornek_sayisi,1);


dogru_sayim=0;
yanlis_sayim=0;

for i=1:test_ornek_sayisi
[siralanan,indeks]=sort(uzaklik_dizisi(:,i));
sirali_uzaklik(:,i)=siralanan;
sirali_indeks(:,i)=indeks;

test_etiketi(i) = Sinif_Bul(VERI.egitim_seti_etiketleri(indeks,1), komsu_sayisi);

if(test_etiketi(i)==(VERI.test_seti_etiketleri(i,1)))
    dogru_sayim=dogru_sayim+1;
else
    yanlis_sayim=yanlis_sayim+1;
end
end

hata =(100*yanlis_sayim)/test_ornek_sayisi;

end