namespace QuantumAlgorithms {

    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    


    operation PinCrack(pincode: Int[]) : Unit {
        using((query, target) = (Qubit[6], Qubit())){
            for(i in 0 .. 5){
                H(query[i]);
            }
            X(target);H(target);

            QuerySearchOracle(query, target, pincode);

            for(i in 0 .. 5){
                H(query[i]);
            }


            let result = [M(query[0]), M(query[1]), M(query[2]), M(query[3]), M(query[4]), M(query[5])];
            Message($"{result}");

            //reset states to Zero
            for(i in 0 .. 5){
                Reset(query[i]);
                Reset(target);
            }

        }

    }



    operation QuerySearchOracle(query : Qubit[], target : Qubit, pincode : Int[]) : Unit{
        //the secret password
        let a = pincode;

        for(i in 0 .. 5){
            if(a[i]==1){
                CNOT(query[i], target);
            }

        }
    }

    operation Reset(qubit : Qubit) : Unit{
        if(M(qubit)==One){

            X(qubit);
        }
    }
}