filename = 'Depth.csv';
data = xlsread(filename);
data = transpose(data);
time = [1/7, 2/7, 3/7, 4/7, 5/7, 6/7, 1];





depth_det = data - detrend(data);


plot(time, depth_det, 'k', time, data, 'g')
title('Depths versus Time')
ylabel('Depths')
xlabel('Time (s)')
legend