include .env
VHDX_PATH = C:\Users\$(USER)\AppData\Local\Packages\CanonicalGroupLimited.Ubuntu_79rhkp1fndgsc\LocalState\ext4.vhdx

clean:
	powershell -Command "wsl --shutdown"
	powershell -Command "optimize-vhd -Path $(VHDX_PATH) -Mode full"