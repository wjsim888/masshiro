% [예제 3.2-1] 관개 수로의 최적화 (3장 함수와 파일)
% 단면적이 100 ft^2 인 사다리꼴 수로에서 둘레의 길이 L을 최소로 하는 d, b, theta를 구한다.
% 사용자 정의 함수(channel)와 fminsearch를 이용한 풀이
%
%   단면적: 100 = d*b + d^2/tan(theta)  ->  b = 100/d - d/tan(theta)
%   둘레:   L = b + 2*d/sin(theta)
%         = 100/d - d/tan(theta) + 2*d/sin(theta)

% x = [d, theta] 의 초기 추정값 (d = 20 ft, theta = 1 rad)
x0 = [20, 1];

% 둘레 L을 최소로 하는 x = [d, theta]
x = fminsearch(@channel, x0);

d = x(1)                          % 깊이 (ft)
theta = x(2);                     % 각도 (rad)
theta_deg = theta*180/pi          % 각도 (도)
b = 100/d - d/tan(theta)          % 바닥 폭 (ft)
L_min = channel(x)                % 최소 둘레 (ft)

% 둘레의 길이 L (x(1) = d, x(2) = theta)
% 스크립트 안의 함수는 파일의 맨 끝에 있어야 한다.
function L = channel(x)
L = 100/x(1) - x(1)/tan(x(2)) + 2*x(1)/sin(x(2));
end
