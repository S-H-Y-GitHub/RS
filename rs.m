function rs(img)
    [m,n] = size(img);
    order = [ %z字型读取数据顺序表
        1  9  2  3  10 17 25 18 ...
        11 4  5  12 19 26 33 41 ...
        34 27 20 13 6  7  14 21 ...
        28 35 42 49 57 50 43 36 ...
        29 22 15 8  16 23 30 37 ...
        44 51 58 59 52 45 38 31 ...
        24 32 39 46 53 60 61 54 ...
        47 40 48 55 62 63 56 64];    
    cols = im2col(img, [8 8], 'distinct');  % 将8x8 的块转化为列
    count = size(cols, 2);                   % 分块数
    cols = cols(order, :);                   % 按照order的顺序排列数据
    for col = cols
        flag = randi([1 3]);        %随机选择一种翻转方式
        switch flag
            case 1                  %正向翻转
                for i = 1:64
                    x = col(i);
                    if(mod(x, 2)==0)
                        col(i) = x+1;
                    else
                        col(i) = x-1;
                    end
                end
            case 2                  %负向翻转
                for i = 1:64
                    x = col(i);
                    if(mod(x, 2)==0)
                        col(i) = x-1;
                    else
                        col(i) = x+1;
                    end
                end
            case 3                  %零翻转
                
        end
    end
    img = col2im(cols, [8, 8], [m, n], 'distinct');
    
end
