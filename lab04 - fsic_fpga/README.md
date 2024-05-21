# Lab 4 - Caravel-FSIC FPGA 

## Outline

- Target goal
  - Implementation complete Caravel-FSIC, FPGA-FSIC and HLS-DMA
  - Use for Caravel Chip pre-tapeout validation
- Implementation
  - Integrate FIR design into user project
    - Add fir-DMA for FIR in FPGA
    - System validation with Python on board
    
## Simulation Building Steps

### Caravel-FSIC FPGA Simulation

``` bash=
$ git clone https://github.com/vic9112/Advance_SOC
$ cd lab04\ -\ fsic_fpga/vivado
$ ./run_vivado_fsic_sim
```
- Above will run FIR on FSIC-FPGA using DMA to stream-in/out the data
- The input and the output of DMA will write into `./vivado/firDMA_in.log` and `./vivado/firDMA_out.log` respectively.


### Caravel-FSIC FPGA Validation

``` bash=
$ git clone https://github.com/vic9112/Advance_SOC
$ cd lab04\ -\ fsic_fpga/vivado
$ ./run_vivado_fsic
```

- Above will generate block diagram which exclude firDMA (userdma), user should open `.xpr` file under `~/vivado/vvd_caravel_fsic` using vivado GUI and:
  1. Add userdma IP into block diagram 
  2. Connect `updma_so` to `inStreamTop`, `updma_si` to `outStreamTop` 
    
  3. Generate bitstream again.
- Reference address editor:
  
- User should change the MMIO address of DMA to the repective address of `userdma` in address editor

