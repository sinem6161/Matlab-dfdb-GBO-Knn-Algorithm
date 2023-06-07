function Verileri_Oku(x)

global VERI
global SINIF_SAYISI

switch x
    case 'diabetic'
        VERI.egitim_seti=table2array(readtable("diabetic.xlsx",'Range','B1:T600'), 'ReadVariableNames' ,false);
        VERI.test_seti=table2array(readtable("diabetic.xlsx",'Range','B600:T1151'), 'ReadVariableNames' ,false);
        VERI.egitim_seti_etiketleri=table2array(readtable("diabetic.xlsx",'Range','A1:A600'),'ReadVariableNames' ,false);
        VERI.test_seti_etiketleri=table2array(readtable("diabetic.xlsx",'Range','A600:A1151'),'ReadVariableNames' ,false);
    case 'vehicle'
        VERI.egitim_seti=table2array(readtable("vehicle.xlsx",'Range','B1:S699'), 'ReadVariableNames' ,false);
        VERI.test_seti=table2array(readtable("vehicle.xlsx",'Range','B699:S846'), 'ReadVariableNames' ,false);
        VERI.egitim_seti_etiketleri=table2array(readtable("vehicle.xlsx",'Range','A1:A699'),'ReadVariableNames' ,false);
        VERI.test_seti_etiketleri=table2array(readtable("vehicle.xlsx",'Range','A699:A846'),'ReadVariableNames' ,false);
    

    otherwise
        warning('Wrong dataset name')
end

etiket=unique(VERI.egitim_seti_etiketleri);
sayim=findgroups(etiket);
SINIF_SAYISI=size(sayim,1);
end