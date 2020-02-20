TOP=counter_tb

all:
	mkdir -p work
	ghdl -i --workdir=work *.vhd
	ghdl -m --workdir=work $(TOP)
	ghdl -r --workdir=work $(TOP) --wave=$(TOP).ghw

clean:
	ghdl --clean --workdir=work
	ghdl --remove --workdir=work
	rm -rf work
	rm -f $(TOP).ghw

