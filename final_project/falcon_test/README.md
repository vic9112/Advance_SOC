# Falcon On-Board Test

## Block diagram

![block diagram](https://github.com/vic9112/Advance_SOC/assets/137171415/98282e05-a2c4-4375-a725-644d0bcd4690)

- During the chip verification phase, we integrated multiple kernels into the PL side of the MPSoC to handle concurrent requests, and middleware to manage requests from Falcon. To minimize the high communication overhead between hardware and software (as illustrated by the green double arrow), the middleware will be implemented as firmware on the RISC-V CPU within the Caravel SoC.

## Performance
- On-Board (KV260) <br>
![result_1PE](https://github.com/vic9112/Advance_SOC/assets/137171415/0dba7572-2d9c-4a85-8002-7d4700a284ec)
- Compare to original software <br>
![螢幕擷取畫面 2024-06-29 134618](https://github.com/vic9112/Advance_SOC/assets/137171415/fc1f6976-c9f7-4c76-9784-4d47972e74c4)
