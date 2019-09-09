/* cjs playing with K
   http://fsl.cs.illinois.edu/FSL/papers/2013/k-primer-2013-v32/k-primer-2013-v32-public.pdf
*/

module EXP-SYNTAX
    import INT          /* now explicit imports needed for predefined sorts */
    syntax Exp ::= Int
                 | "(" Exp ")"              [bracket]
                 | Exp "+" Exp              [seqstrict]
                 | Exp "*" Exp              [seqstrict]
                 | Exp "/" Exp              [seqstrict]
                 | "read"
                 | "print" "(" Exp ")"      [strict]
    syntax KResult      /* predefined before? */
endmodule

module EXP
    import EXP-SYNTAX
endmodule
