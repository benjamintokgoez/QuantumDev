namespace QuantumAlgorithms {

    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    


    operation BellStateDev() : Unit {
        mutable ones = 0;
        mutable zeros = 0;
        for(i in 0..99){
            using((qubit1, qubit2) = (Qubit(), Qubit())){
                BellState(qubit1, qubit2);

                Z(qubit1);
                T(qubit2);
                


                let value1 = M(qubit1);
                let value2 = M(qubit2);

                Message($"Result of qubit1: {value1}, result of qubit2: {value2}");

                ResetQubit(qubit1);
                ResetQubit(qubit2);
        }

        
    }
        
    }
    //creates a Bell-State. An entanglement between q1 and 2. (|00> + |11>)
    operation BellState(q1 : Qubit, q2 : Qubit) : Unit{
        H(q1);
        CNOT(q1, q2);
    }

    operation ResetQubit(qubit : Qubit) : Unit {
        if(M(qubit) == One){
            X(qubit);
        }
    }
}

