include .env
VHDX_PATH = C:\Users\$(USER)\AppData\Local\Packages\CanonicalGroupLimited.Ubuntu_79rhkp1fndgsc\LocalState\ext4.vhdx

build:
	docker build -t vivado:2023.1 .

run:
	docker run -it -v "D:\tmp":/tmp --name vivado -w /root rockylinux:8

clean:
	powershell -Command "wsl --shutdown"
	powershell -Command "optimize-vhd -Path $(VHDX_PATH) -Mode full"