function x = GE(A,b)
s_A = size(A);
if s_A(1) ~= s_A(2)
 disp('Matrix A is not a square matrix');
elseif s_A(1) ~= size(b,1)
 disp('Matrix b dimensions not compatible with A');
else
 N = s_A(1);
 for i = 1:N-1 
 max = abs(A(i,i));
 idx = i;
 for j = i+1:N
 if abs(A(j,i)) > max
 max = abs(A(j,i));
 idx = j;
 end
 end
 if idx ~= i
 temp_A = A(idx,:);
 temp_b = b(idx);
 A(idx,:) = A(i,:);
 b(idx) = b(i);
 A(i,:) = temp_A;
 b(i) = temp_b;
 end

 for j = i+1:N
 m = -1*A(j,i)/A(i,i); 
 for k = i:N
 A(j,k) = A(j,k) + m * A(i,k);
 end
 b(j) = b(j) + m * b(i);
 end
 end


 x = zeros(N,1);
 for i = N:-1:1
 sum = 0;
 for j = i+1:N
 sum = sum + A(i,j) * x(j);
 end
 x(i) = (b(i) - sum)/A(i,i);
 end
end
