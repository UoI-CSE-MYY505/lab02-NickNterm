
.data

array: .word 10, 2, -5

.text
    la a0, array # address of array
    li a1, 3     # length of array
    li a2, 10     # value to search for
prog:
    add t0, zero, a1        # Load the length of the array to the t0
                            # t0 will be the index
    add s0, zero, zero      # t1 will be the final result. 
                            # if not found the t1 will be 0
    beq a1, zero, zeros        # if the length is 1, we don't need to search
    addi t0, t0, -1
    
loop:
    blt t0, zero, zeros
    add t2, t0, zero        # Load the t2 with the index
    slli t2, t2, 2          # shift left by 2 == multiply by 4
    add t2, t2, a0          # add the address of the array to the t2
                            # finally t2 is the address of the element we want
    lw s0, 0(t2)            # loading the t3 with the actuall array value
    addi t0, t0, -1         # decrease the counter t0
    bne s0, a2, loop        # end the loop if the value is found
                            # else if we have t3 == a2 we found it and continue
    add s0, zero, t2
    j done

zeros:
    add s0, zero, zero

done:
    addi a7, zero, 10 
    ecall
