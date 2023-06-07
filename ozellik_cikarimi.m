function [knn_performans,sayac,egitim_seti,test_seti]=ozellik_cikarimi(enIyiCozum,egitim_seti,test_seti,komsu_sayisi,esik)

[~,indeks]=size(enIyiCozum);

sayac=0;
i=indeks;
while i>0
    if(enIyiCozum(1,i)<esik)
        egitim_seti(:,i)=[];
        test_seti(:,i)=[];
        sayac=sayac+1;
    end
    i=i-1;
end

[knn_performans]=Knn(egitim_seti,test_seti,komsu_sayisi);
end