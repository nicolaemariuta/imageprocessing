function O = blend( A,w_A,B,w_B )
    O1 = immultiply(A,w_A);
    O2 = immultiply(B,w_B);
    O = imadd(O1,O2);
end
