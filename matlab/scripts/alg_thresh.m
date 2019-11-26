function T = alg_thresh(a,deltaT)
    T = mean(a);
    T_old = 0;

    while T - T_old >= deltaT
        T_old = T;

        G1 = a(a > T);
        G2 = a(a <= T);

        m1 = mean(G1);
        m2 = mean(G2);

        T = (m1 + m2)/2.0;

    end
   
end

