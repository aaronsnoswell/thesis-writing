
% Computes and saves a bunch of 3D PSF slices

for i = 12:-2:2
    psf = fspecial('motion', i);
    
    im = zeros(14, 13);
    left = ((14-i)/2);
    im(7, left:left+i) = psf;
    im = imresize(im, 20, 'bilinear');
    
    [h, w] = size(im);
    im = im(1:w, 1:w);
    
    % Artificially boost dark values for display purposes
    im = imadjust(im, [0 1], [0 1], 0.8);
    
    imwrite(im, sprintf('psf_%d.png', i));
end


