# U6143_ssd1306

SSD1306 Modified Driver and Installer Script for UCTRONICS U6143 Raspberry Pi Rackmount Case. Modified source project to display temps in Celsius and dynamically configure system hostname in header file using installer script. Installer script also configures systemd rc-local functionality and enables OLED screen using the modified parameters at boot.

##  Installing
Download installer script, set executable, and run with Bash: For now - run as root!
```bash
sudo -i
wget https://raw.githubusercontent.com/SportzDigital/U6143_ssd1306/master/install.sh
chmod +x install.sh
./install.sh
```

# Original Project Readme

##  I2C
Begin by enabling the I2C interface:

```bash
sudo raspi-config
```

Choose `Interface Options` | `I2C`, then answer `Yes` to whether you would like the ARM I2C interface to be enabled.

Install Git and library dependencies

```bash
sudo apt update
sudo apt install git wiringpi
```

##  Clone U6143_ssd1306 library 
```bash
git clone git@github.com:SportzDigital/U6143_ssd1306.git
```

## Compile 
```bash
cd U6143_ssd1306/C
```
```bash
make clean && make 
```

## Run 
```
sudo ./display
```

## Add automatic start script
Copy the binary file to `/usr/local/bin/`:

```bash
sudo cp ./display /usr/local/bin/
```

Choose one of the following configuration options (`systemd` **or** `rc.local`):
 
```bash
sudo cp ./contrib/U6143_ssd1306.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable U6143_ssd1306.service
sudo systemctl start U6143_ssd1306.service
```

**OR** add the startup command to the `rc.local` script (not recommended)

```bash
sudo nano /etc/rc.local
```

and add the command to the rc.local file:

```bash
/usr/local/bin/display &
```

Reboot your system:

```bash
sudo reboot now
```

## BMP creation

https://www.mischianti.org/images-to-byte-array-online-converter-cpp-arduino/
