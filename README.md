# Xanmod-Lite Kernel Configuration

## Usage

To install and apply the kernel configuration, use the following commands:

```bash
apt install jq curl wget -y && wget https://raw.githubusercontent.com/neomikanagi/Xanmod-Lite/main/xanmodlite.sh && chmod +x xanmodlite.sh && ./xanmodlite.sh
```

## Disclaimer
Everything in this repository was done by ChatGPT-4o Canvas, which independently decided how to trim the kernel. I simply saved it to GitHub without modification.
I distributed this kernel to my friends for use on their proxy servers to help bypass the oppressive internet censorship in evil China. So far, there have been no major issues reported. 
If you download and use it, it means that you agree that freedom of speech and the right to know are rights based on natural law and are inalienable basic rights given to everyone by God.

## Summary of Disabled Features
The disable.config file disables a wide range of kernel configuration items to streamline system functionality and remove unnecessary hardware support. Below is a summary of the main disabled items:

1. **Hardware Support and Drivers**
   - **Legacy Hardware Interfaces and Protocols**: Options like `CONFIG_PARPORT` (parallel port), `CONFIG_PATA` (Parallel ATA), and `CONFIG_PCMCIA` (PCMCIA cards) are disabled because they support legacy hardware that is not used in modern VPS environments.
   - **Specialized Hardware Drivers**: Configurations like `CONFIG_AMILO`, `CONFIG_HP`, `CONFIG_THINKPAD`, and `CONFIG_TOSHIBA`, which support specific vendor hardware, are disabled as they are not needed in a VPS setting.
   - **Wireless Devices and Sensors**: Drivers for wireless devices and sensors, such as `CONFIG_WIRELESS`, `CONFIG_WLAN`, `CONFIG_BMC150`, and `CONFIG_BME680`, are disabled since VPS instances do not interact directly with such hardware.
   - **Legacy Network Protocols and Interfaces**: Protocols like `CONFIG_ARCNET`, `CONFIG_FDDI`, `CONFIG_DECNET`, and `CONFIG_ATM` are outdated and not used in modern network environments, making them unnecessary for a VPS.

2. **Multimedia and Input Devices**
   - **Multimedia and Graphics Drivers**: Options like `CONFIG_DRM` (Direct Rendering Manager), `CONFIG_FB` (frame buffer), `CONFIG_V4L`, and `CONFIG_DVB` (Digital Video Broadcasting) are disabled, as VPS servers do not require multimedia or graphics support.
   - **Input Devices**: Configurations like `CONFIG_HID`, `CONFIG_HIDRAW`, `CONFIG_TOUCHSCREEN`, `CONFIG_JOYSTICK`, and `CONFIG_MOUSE` are disabled because VPS instances do not require user input devices like keyboards, mice, or touchscreens.
   - **Sound and Audio Drivers**: Audio-related options like `CONFIG_SND`, `CONFIG_SOUND`, and `CONFIG_SOUNDWIRE` are disabled, as audio functionality is not required in a typical VPS environment.

3. **Power Management and Hardware Monitoring**
   - **Power Management**: Options like `CONFIG_ACPI`, `CONFIG_PM`, `CONFIG_BATTERY`, `CONFIG_HIBERNATION`, and `CONFIG_SUSPEND` are disabled since VPS instances do not manage power states or use battery power.
   - **Hardware Monitoring**: Features like `CONFIG_HWMON` and `CONFIG_SENSORS` are disabled, as hardware monitoring (e.g., temperature, fan speed) is not applicable in a virtualized environment.

4. **Virtualization and Debug Tools**
   - **Virtualization Optimizations**: Options such as `CONFIG_XEN_*`, `CONFIG_HYPERV`, and `CONFIG_KVM` are disabled if the VPS is not running on the corresponding virtualization platform, as these options are specific to Xen, Hyper-V, and KVM environments.
   - **Debugging and Tracing Tools**: Options like `CONFIG_DEBUG`, `CONFIG_TRACE`, and `CONFIG_TRACING` are disabled because they are used for kernel debugging and are not necessary for production VPS environments.

5. **File System and Storage**
   - **Legacy or Uncommon File Systems**: File systems like `CONFIG_JFS`, `CONFIG_XFS`, and `CONFIG_BTRFS` are disabled if not used by the VPS, as modern VPS instances often use mainstream file systems like ext4.
   - **Uncommon Storage Protocols**: Options like `CONFIG_SCSI` and `CONFIG_MTD` are disabled since they support specific storage devices or protocols that are not relevant to most VPS environments.

6. **Networking and Security Features**
   - **Uncommon Network Drivers and Protocols**: Configurations like `CONFIG_CAN`, `CONFIG_NET_FDDI`, and `CONFIG_NET_VENDOR_*` are disabled because they support specialized network hardware or outdated protocols.
   - **Uncommon Security and Encryption**: Options like `CONFIG_CRYPTO` and `CONFIG_TRUSTED` are disabled as VPS instances typically do not use specialized hardware encryption modules.

7. **Special Purpose Hardware and Embedded Device Support**
   - **Sensors and Embedded Devices**: Configurations like `CONFIG_I2C`, `CONFIG_SPI`, `CONFIG_FPGA`, and `CONFIG_GPIO` are disabled, as they support sensors and embedded hardware that are not present in a virtualized environment.
   - **Specialized Devices and Controllers**: Options like `CONFIG_MFD`, `CONFIG_PMIC`, and `CONFIG_PMBUS` are disabled since they are used for managing embedded hardware and power controllers, which are irrelevant for VPS instances.
