function [lstLong, lstShort, ml] = get_lstSS_LL(obj, rhoSD_ssThresh)
% obj = SnirfLoad('C:\Edgar\Dropbox\CIACYT\Students\Michelle\fNIRS Yoga\Training31\arithmetic\Arithmatic Test.snirf')
% obj = SnirfLoad('C:\Edgar\Dropbox\CIACYT\Students\Michelle\fNIRS Yoga\Training32\AtlasViewer.snirf')

%% find list of long and short separation channels
SrcPos = obj.probe.GetSrcPos();
DetPos = obj.probe.GetDetPos();
ml     = obj.data.GetMeasListSrcDetPairs();

lst = 1:size(ml,1);
rhoSD = zeros(length(lst),1);
posM = zeros(length(lst),3);
for iML = 1:length(lst)
    rhoSD(iML) = sum((SrcPos(ml(lst(iML),1),:) - DetPos(ml(lst(iML),2),:)).^2).^0.5;
    posM(iML,:) = (SrcPos(ml(lst(iML),1),:) + DetPos(ml(lst(iML),2),:)) / 2;
end
lstLong = lst(find(rhoSD>rhoSD_ssThresh));
lstShort = lst(find(rhoSD<=rhoSD_ssThresh));
end
