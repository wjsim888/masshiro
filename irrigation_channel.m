function irrigation_channel
% [예제 3.2-1] 관개 수로의 최적화 (3장 함수와 파일)
% 단면적이 100 ft^2 인 사다리꼴 수로에서 둘레의 길이 L을 최소로 하는 d, b, theta를 구한다.
% 주 함수(irrigation_channel)와 부함수(channel)로 이루어진 함수 파일, fminsearch를 이용한 풀이
% 명령 창에서 irrigation_channel 을 입력하여 실행한다.
%
%   단면적: 100 = d*b + d^2/tan(theta)  ->  b = 100/d - d/tan(theta)
%   둘레:   L = b + 2*d/sin(theta)
%         = 100/d - d/tan(theta) + 2*d/sin(theta)

% x = [d, theta] 의 초기 추정값 (d = 20 ft, theta = 1 rad)
x0 = [20, 1];

% 둘레 L을 최소로 하는 x = [d, theta]
% 부함수 channel은 같은 파일 안의 함수에서만 호출할 수 있다.
x = fminsearch(@channel, x0);

d = x(1)                          % 깊이 (ft)
theta = x(2);                     % 각도 (rad)
theta_deg = theta*180/pi          % 각도 (도)
b = 100/d - d/tan(theta)          % 바닥 폭 (ft)
L_min = channel(x)                % 최소 둘레 (ft)
end

% 부함수: 둘레의 길이 L (x(1) = d, x(2) = theta)
function L = channel(x)
L = 100/x(1) - x(1)/tan(x(2)) + 2*x(1)/sin(x(2));
end
