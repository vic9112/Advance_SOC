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
![sim_bd](https://github.com/vic9112/Advance_SOC/assets/137171415/5408b4f4-6491-4b62-96e1-1dc9bcbe08fa)

``` bash=
$ git clone https://github.com/vic9112/Advance_SOC
$ cd lab04\ -\ fsic_fpga/vivado
$ ./run_vivado_fsic_sim
```
- Above will run FIR on FSIC-FPGA using DMA to stream-in/out the data
- The input and the output of DMA will write into `./vivado/firDMA_in.log` and `./vivado/firDMA_out.log` respectively.


### Caravel-FSIC FPGA Validation
![val_bd](https://github.com/vic9112/Advance_SOC/assets/137171415/f9d085fc-3e92-4979-ae67-2254c456df44)

``` bash=
$ git clone https://github.com/vic9112/Advance_SOC
$ cd lab04\ -\ fsic_fpga/vivado
$ ./run_vivado_fsic
```

- Above will generate block diagram which exclude firDMA (userdma), user should open `.xpr` file under `~/vivado/vvd_caravel_fsic` using vivado GUI and:
  1. Add userdma IP into block diagram 
  2. Connect `updma_so` to `inStreamTop`, `updma_si` to `outStreamTop` 
    ![connect](https://github.com/vic9112/Advance_SOC/assets/137171415/bcc43c32-78eb-4d0f-8070-8b37aba8eecf)
    ![connect](https://github.com/vic9112/Advance_SOC/assets/137171415/7bcd58fa-601d-4a80-9f8b-bab7cd2d2344)
  3. Generate bitstream again.
- Reference address editor:
  ![address editor](https://github.com/vic9112/Advance_SOC/assets/137171415/fe520440-45ff-45a8-96f7-a6c573c7a5d0)
- User should change the MMIO address of DMA to the repective address of `userdma` in address editor

