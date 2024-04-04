# Lab2 Catapult Project - Edge Detect

## Edge Detection Algorithm

- Used in many image and video processing algorithms
- Computing the image gradient detects the edges in an image
  - Magnitude gives the strength of the edge
  - Angle gives the direction of the edge
- Gradient Magnitude
  - Compute derivatives of the image in the horizontal(x) and vertical(y) directions

## Description of the files&folders:

- We integrated version 1 into FSIC `~/fsic_prj/dsn/rtl/concat_EdgeDetect_Top_fsic.v`
- In `~/synthesis_report`:
  - `RTL.rpt` is the synthesis report of original version of edge_detector
  - `RTL_optimized.rpt` is the oprimized version.
- In `~/simulation_result`:
  - `simulation.log` is the C simulation log file
  - `simulation_result_of_FSIC` is the log file generated after we simulate our EdgeDetect(version 1) on FSIC
- In `~/catapult_project`: 
  - `directives.tcl` can generate the first version of edge_detector, which has the throughput=6
  - `directives_optimized.tcl` can generate the optimized version of edge_detector, which has the throughput=1

## Run
``` bash=
~$ cd ~/catapult_project; catapult -f directives.tcl &
```

