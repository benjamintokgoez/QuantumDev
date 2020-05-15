namespace QuantumAlgorithms {

    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    

    @EntryPoint()
    operation Main() : Unit {
        
        //Realize an entangled state between two qubits.
        //BellStateDev();
        //use the PinCrack function with your secret binary array. Currently it's limited to 6 bits.
        PinCrack([1, 0, 1, 1, 0, 1]);



    }

}