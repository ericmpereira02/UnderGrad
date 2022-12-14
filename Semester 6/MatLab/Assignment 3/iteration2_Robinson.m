a = [1, 2, 3, 4, 5];
b = [0, 0, 0, 0, 0];
x = 2;

for index = 1:5
    b(index) = (x*a(index)) + a(index);
end

disp(b);

