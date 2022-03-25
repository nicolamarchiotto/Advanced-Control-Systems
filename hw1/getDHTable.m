function [DHTable] = getDHTable()
% matrix 5*4, each rows corrisponds to the value respectively of
% [theta, alfa, a, d]

syms d1 d2 d3 
DHTable=[   -pi/2   -pi/2   0   0.4;
            0       pi/2    0   d1+0.2;
            -pi/2   pi/2    0   d2-0.1498;
            0       0       0   d3+0.2  ];
end