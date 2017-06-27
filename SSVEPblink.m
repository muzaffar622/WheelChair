
width_vs_height = 16/9;

map = ones(256,3);
map(1,:) = 1;


hblock = 64;
wblock = round(64*width_vs_height);
nblock=1;
npix_w=wblock*nblock;
npix_h=hblock*nblock;
X1 = uint8(ones(npix_h,npix_w));
X2 = uint8(zeros(npix_h,npix_w));
    

figure;
try;
    setFigureWide;
catch;
end
subplot(1,2,1);
try;imshow(X1,map);catch;image(X1);colormap(map);end
title('Frame 1');
axis equal;axis tight;
subplot(1,2,2);
try;imshow(X2,map);catch;image(X2);end
title('Frame 2');
axis equal;axis tight;

desired_rates_Hz = [1:20]; 
for Irate = 1:length(desired_rates_Hz)
    desired_rate_Hz = desired_rates_Hz(Irate);
    
    
    desired_rate_Hz = desired_rates_Hz(Irate); 
    desired_duration_sec = 15;
    n_frames = round(desired_rate_Hz * desired_duration_sec)
    clear M
    for I = 1:n_frames
        M((I-1)*2+1)=im2frame(X1,map);
        M((I-1)*2+2)=im2frame(X2,map);
    end
    
   
    
    
    outpname=['Movies_' num2str(nblock) 'block\'];
    try;mkdir(outpname);catch;end;
    outfname = [outpname 'checkerboard' num2str(nblock) '_rate' num2str(desired_rate_Hz) 'HzX2'];
    if (1)
    
        outfname = [outfname '.avi'];
        disp(['Writing to ' outfname]);
        movie2avi(M,outfname,'Compression','none','FPS',desired_rate_Hz*2);
    else
    	
        clear video2
        video2.width=size(M(1).cdata,2);
        video2.height=size(M(1).cdata,1);
        video2.frames=M;
        video2.rate=desired_rate_Hz*2;
        video2.times=[0:1:length(M)-1] /video2.rate;
        
        outfname = [outfname '.wmv'];
        disp(['Writing to ' outfname]);
        mmwrite(outfname,video2);
    end
end
