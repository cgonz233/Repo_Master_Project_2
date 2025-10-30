% Caroline Gonzalez 1231918612

n = input("Enter a positive number between 100 and 200: ");

for x = 1:n
    if mod(x, 21) ==0
        disp(x)
    elseif mod(x, 3) == 0 || mod(x, 7) == 0
        continue;
    else
        disp(x)
    end
end







