
function [sinif]= Sinif_Bul(label,komsu_sayisi)

global SINIF_SAYISI;

labels=unique(label);
siniflar=zeros(SINIF_SAYISI,1);
%labels=string(labels);

for j=1:komsu_sayisi

    aranan_indeks=find(labels==label(j));
    siniflar(aranan_indeks)=siniflar(aranan_indeks)+1;
end
[~,boyut]=max(siniflar);
sinif=labels(boyut);
end
