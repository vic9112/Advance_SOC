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
- The input and the output of DMA will write into `firDMA_in.log` and `firDMA_out.log` respectively.


### Caravel-FSIC FPGA Validation

``` bash=
$ ./run_vivado_fsic
```

- Above will generate bitstream and hardware header file into `./jupyter_notebook`, which has finished connecting DMA into block design.

