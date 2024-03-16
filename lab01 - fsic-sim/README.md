# Lab 1 - FSIC Simulation

## Simulation for FIR

``` bash
$ cd ~/lab01-fsic-sim/fsic-sim/fsic-fpga/rtl/user/testbench/tc
$ source run_xsim
```
- Above generate fir_sim.vcd
- Then we can see the waveform by using GTKWave to open `.vcd` file

``` bash=
$ gtkwave fir_sim.vcd
```


## Change the type of Simulation

- Inside [tb_fsic.v](https://github.com/vic9112/Advance_SOC/blob/main/lab01%20-%20fsic-sim/fsic_fpga/rtl/user/testbench/tb_fsic.v)
  We can change tasks we want to simulate here.
  ![tb](https://github.com/vic9112/Advance_SOC/assets/137171415/8ceb0493-1daa-49ac-b953-68c3e9f7fe72)

## Test#1 - FIR Initialization from SOC Side
- Results
  ![from soc](https://github.com/vic9112/Advance_SOC/assets/137171415/a7d0570e-44ee-4b73-92d2-5df21a068393)

## Test#2 - FIR Initialization from FPGA Side
- Results
  ![from fpga](https://github.com/vic9112/Advance_SOC/assets/137171415/0ca8e151-7732-463c-b673-8dc150d29ecf)


