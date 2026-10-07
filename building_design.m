% [예제] 내진 빌딩 설계 (W5, 2장 수치/셀/구조체 배열 (3))
% 특성 다항식 (alpha - f^2)[(2alpha - f^2)^2 - alpha^2] + alpha^2 f^2 - 2alpha^3 = 0
% 의 양의 근이 건물의 고유진동수(cycle/sec)이다.
% 강의록의 다항식 곱(conv), 다항식 덧셈/뺄셈(0 채우기), 근(roots)을 이용한 풀이

k = 5e6;                     % 기둥의 강도 (N/m)
m = 1000;                    % 바닥의 질량 (kg)
alpha = k/(4*m*pi^2);

% f에 대한 다항식 계수 (지수가 낮아지는 순서: f^2, f, 상수)
p1 = [-1, 0, alpha];         % alpha - f^2
p2 = [-1, 0, 2*alpha];       % 2alpha - f^2

% (2alpha - f^2)^2 - alpha^2  -> 4차 다항식, 상수항에만 alpha^2를 빼도록 0 채움
p3 = conv(p2, p2) - [0, 0, 0, 0, alpha^2];

% (alpha - f^2) * [(2alpha - f^2)^2 - alpha^2]  -> 6차 다항식
p4 = conv(p1, p3);

% + alpha^2 f^2 - 2alpha^3  -> 6차 다항식에 맞춰 0 채움
p5 = p4 + [0, 0, 0, 0, alpha^2, 0, -2*alpha^3];

% 특성 다항식의 근
r = roots(p5)

% 고유진동수 = 양의 근 (r > 0 인 원소만 골라냄)
f = r(r > 0)
