# icePie FPGA devkit - Virtual USB demos

Example codes demonstrating implementation of Virtual USB Host / Device support on the icePie FPGA devkit.

## Requirements

Make sure the submodules are installed properly. Run `git submodule update --init --recursive` from `icePie-examples/9-vusb` directory.

* For Host mode operation (USB Keyboard / Mouse), FB22 pads (near VUSB connector) needs to be bridged for supplying +5v to USB devices

## Projects

* Sylvian Munaut's [ice40playground/usb_audio](https://github.com/smunaut/ice40-playground) - USB Audio Class Device (Soundcard)

  Run `git submodule update --init --recursive` from `icePie-examples/9-vusb/ice40-playground` directory
  
  Run `make prog` from `icePie-examples/9-vusb/ice40-playground/projects/usb_audio` directory for building the FPGA bitstream.

  Run `make -C fw prog` from `icePie-examples/9-vusb/ice40-playground/projects/usb_audio` directory for building the RiscV fw for USB Audio Class.

  Run `miniterm.py /dev/ttyUSB0 100000` (or other terminal program on appropriate serial port) to access the Command terminal / see the Status updates.

* Nand2Mario's [usb_hid_host](https://github.com/nand2mario/usb_hid_host) - USB HID Host - Keyboard / Mouse / Gamepad support

  Run `make` and then `make prog` from `usb_hid_host/boards/icepie/` directory.
  
## Licenses

  Applicable license is individual to each IP core / project and is mentioned in the IP core / example directory itself and in each file.


