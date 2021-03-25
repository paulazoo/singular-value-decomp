I = double(rgb2gray(imread('onion.png')));
[U,S,V] = svd(I);
[S_rows, ~] = size(S);

S20_cutoff = ceil(S_rows*0.2);
S30_cutoff = ceil(S_rows*0.3);
S50_cutoff = ceil(S_rows*0.5);
S80_cutoff = ceil(S_rows*0.87);

X_R20 = S;
X_R20(S20_cutoff:end, :) = 0;
X_R20(:, S20_cutoff:end) = 0;

X_R30 = S;
X_R30(S30_cutoff:end, :) = 0;
X_R30(:, S30_cutoff:end) = 0;

X_R50 = S;
X_R50(S50_cutoff:end, :) = 0;
X_R50(:, S50_cutoff:end) = 0;

X_R80 = S;
X_R80(S80_cutoff:end, :) = 0;
X_R80(:, S80_cutoff:end) = 0;

figure(1)
hold on
colormap(gray)
subplot(2,2,1)
imagesc(U*X_R20*V')
title('20%')
subplot(2,2,2)
imagesc(U*X_R30*V')
title('30%')
subplot(2,2,3)
imagesc(U*X_R50*V')
title('50%')
subplot(2,2,4)
imagesc(U*X_R80*V')
title('80%')
