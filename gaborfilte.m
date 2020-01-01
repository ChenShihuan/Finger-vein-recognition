aaa=1;
for a = 4
    for b = 1:10  
% a = 1;
% b = 1;
            s1=strcat('.\590\二值化2\','590-',num2str(a),'-',num2str(b),'-','1','.bmp'); 
            Input = imread(s1);
%             Input = ~Input;
            Input = uint8(Input);
            Input(Input>0)=255;

            GabOut = gaborfilter2(Input, 0.035, 0.8, 0, 0);
%             gaborArray = gabor([4 23],[85 90],'SpatialAspectRatio', 0.33);
%             GabOut = imgaborfilt(Input,gaborArray);
%             figure
%             subplot(2,2,1);
%             for p = 1:4
%                 subplot(2,2,p)
%                 imshow(GabOut(:,:,p),[]);
%                 theta = gaborArray(p).Orientation;
%                 lambda = gaborArray(p).Wavelength;
%                 title(sprintf('Orientation=%d, Wavelength=%d',theta,lambda));
%             end
%             figure
%             imshowpair(GabOut(:,:,4),Input,'montage')
%             Gabimg = GabOut(:,:,4);
%             Gabimg = real(Gabimg);
%             Gabimg(Gabimg<0)=0;
%             Gabimg = imbinarize(Gabimg);
%             figure
%             imshow(Gabimg)
%             imshowpair(GabOut,Input,'montage')
            s2=strcat('.\590\gabor2\','590-',num2str(a),'-',num2str(b),'-','1','.bmp'); 
            imwrite(GabOut,s2)
            fprintf('执行次数 %d .\n', aaa);
            aaa = aaa + 1;
    end
end