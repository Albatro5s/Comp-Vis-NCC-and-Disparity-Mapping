%% Problem 1
iml = im2double(imread('left.png'));
imr = im2double(imread('right.png'));

% template = im2double(imread('template.png'));
% search = im2double(imread('search.png'));

[r,c,l] = size(iml);
scores = zeros(r,c,l);

template = imr(1:11,1:11);

% mean and standard deviation for each channel
meanTemp = mean(template(:,:,1),'all');
stdTemp = std(template(:,:,1),0,'all');

% compute NCC score 
    for r = 11:245
        for c = 11:245
            
            P = iml(r-10:r+10,c-10:c+10,:);
            T = template;
            meanP = mean(P(:,:,1),'all');
            stdP = std(P(:,:,1),0,'all');
            val = 0;
            for x = 1:11
                for y = 1:11
                    val = val + ((P(x,y,1)-meanP)*(T(x,y,1)-meanTemp)/(stdP*stdTemp));
                end
            end
            val = val/(11*11-1);
            scores(r,c,1) = val;
            
        end
    end

% best match found
scores = mean(scores,3);
k1 = max(max(scores));
[a,b] = find(scores == k1);
imagesc(search(a-10:a+10,b-10:b+10,:));

% plot the NCC scores
ls = reshape(scores,1,[]);
ls = sort(ls,'descend');
plot(ls,'-r');
xlabel('k');
ylabel('NCC');
