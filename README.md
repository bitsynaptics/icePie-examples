# icePie FPGA devkit - Examples

![icePie-FPGA-devkit](/icepie-examples/docs/icePie-FPGA-devkit.jpg)

Examples codes demonstrating various hardware features built into the icePie FPGA devkit board. 

## Requirements: 

* [apio](https://github.com/FPGAwars/apio)

	`$ pip install apio`

	`$ apio install --all`

	`$ apio drivers --ftdi-enable`

  Use `apio build` and `apio upload` on example directories with `apio.ini` file. `apio clean` for clearing build files. 
 
* [oss-cad-suite](https://github.com/YosysHQ/oss-cad-suite-build/releases)
  
  Decompress the package and run `source environment` inside the oss-cad-suite directory.

  Add the bin directory to PATH in .bash_profile for convenience (ex: `export PATH=$PATH:~/fpga/oss-cad-suite/bin`).

  Use `make` and `make prog` on example directories with `Makefile`. `make clean` for clearing build files.

## Board Support:

Add the following lines to apio boards.json (use `pip show apio` to find path, typically located at /usr/lib/python3.x/site-packages/apio/resources/boards.json).
Note to add comma at the end of last board entry and insert the lines before the last `}`.

	"icePie": {
	    "name": "icePie",
	    "fpga": "iCE40-UP5K-SG48",
	    "programmer": {
	      "type": "iceprog"
	    },
	    "usb": {
	      "vid": "0403",
	      "pid": "6010"
	    },
	    "ftdi": {
	      "desc": "(?:Dual RS232-HS)|(?:icePie.*)"
	    }
	  }

## Pin Mapping:

The icePie FPGA devkit board is based on [1BitSquared iCEBreaker FPGA Board](https://1bitsquared.com/products/icebreaker), with similar pin mappings. 
For details on shared IOs for OLED, SD Card, Encoder, Buttons and ESP32 GPIOs, see `icePie.pcf` pin constraints file. 

## Licenses

Applicable license is individual to each IP core / project and is mentionnned
in the IP core / example directory itself and in each file.


