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

1. Sound Subsystem Drivers
All sound subsystem (SoC) drivers have been disabled, including various audio codecs, power amplifiers, and audio processors (e.g., SSM2602_SPI, SND_SOC_TAS2552, SND_SOC_TLV320AIC23, SND_SOC_WM5102, SND_SOC_WCD9335).
This affects support for various sound cards and high-fidelity audio processing hardware.

2. Video Device Drivers
Many video device drivers have been disabled, covering video capture, decoding, tuners, and signal processing chips (e.g., VIDEO_SAA7146, VIDEO_TW9900, VIDEO_TC358743, VIDEO_TDA7419, VIDEO_TEA6415C).
This removes support for various cameras, video decoding devices, and TV tuners.

3. Wireless Networking Drivers
Support for wireless networking devices, including WiFi and cellular network modules, has been disabled (e.g., WLAN_VENDOR_INTEL, WLAN_VENDOR_REALTEK, WLAN_VENDOR_MEDIATEK, WIRELESS_EXT, WWAN).
This impacts the functionality of WiFi devices, cellular data modules, and other wireless networking components.

4. X86 Machine Check and Virtualization Support
X86 architecture machine check exception (MCE) and virtualization support have been disabled (e.g., X86_MCE_AMD, X86_MCE_INTEL, X86_SGX_KVM, XEN_SYS_HYPERVISOR).
This affects hardware error detection and virtualization features.

5. Xen Hypervisor Support
Xen hypervisor support has been disabled (e.g., XEN_SYS_HYPERVISOR).
This removes the ability to manage virtual machines through the Xen hypervisor.

6. XFS File System Support
XFS file system support has been disabled (e.g., XFS_FS).
This removes support for the high-performance journaling file system commonly used in large storage systems.

7. USB Network and Cellular Modules Support
Support for several USB network and cellular modules has been disabled (e.g., USB_NET_QMI_WWAN, USB_SERIAL_SIERRAWIRELESS, USB_SERIAL_WWAN).
This impacts the use of USB-connected wireless data cards and cellular network modules.

8. TV Signal Processors and Video Decoders
Support for TV signal processing and video decoding chips has been disabled (e.g., VIDEO_TVP514X, VIDEO_TDA7432, VIDEO_TDA7419, VIDEO_TW5864, VIDEO_TW9910).
This affects the ability to process analog TV signals and video decoding.

9. USB Video Capture Cards
Support for USB video capture devices has been disabled (e.g., VIDEO_USBTV).
USB video capture cards will no longer be supported.

10. Audio Compression Processing
Support for audio data compression and decompression has been disabled (e.g., SND_SOC_COMPRESS).
This impacts audio data compression functionality.

11. SoC Cross-Platform Audio Support
Support for cross-platform SoC audio modules has been disabled (e.g., SND_SOC_TOPOLOGY, SND_SOC_XILINX_I2S, SND_SOC_CS35L41).
This impacts audio handling in embedded systems.

12. Audio Power Amplifiers
Support for several audio power amplifiers has been disabled (e.g., SND_SOC_TPA6130A2, SND_SOC_WM5102, SND_SOC_CS35L41).
These components are typically used to drive high-volume audio output devices.

13. Video Tuner Support
Support for various video tuners has been disabled (e.g., VIDEO_TUNER, VIDEO_TEA6415C, VIDEO_TEA6420, VIDEO_THP7312).
This removes TV tuning and signal processing capabilities.

14. Machine Check Exception Logging
Machine check exception logging has been disabled (e.g., X86_MCELOG_LEGACY).
This impacts the system's ability to log and report hardware errors.

15. Embedded System Video Support
Support for video input, output, and processing in embedded systems has been disabled (e.g., VIDEO_VIM2M, VIDEO_VIMC, VIDEO_V4L2_I2C).
This affects video handling in embedded platforms.

16. SoC DSP Audio Processing
Support for several SoC digital signal processors (DSP) for audio processing has been disabled (e.g., SND_SOC_WM_ADSP, SND_SOC_TLV320AIC32X4, SND_SOC_WM8770).
This impacts DSP audio processing capabilities.

17. SoC Audio Libraries
Support for multiple SoC audio libraries has been disabled (e.g., SND_SOC_CS35L41_LIB, SND_SOC_TLV320AIC32X4_LIB, SND_SOC_WM_ADSP).
Common libraries for audio signal processing will no longer be supported.

18. Video Graphics Hardware Acceleration
Support for hardware acceleration for graphics and video has been disabled (e.g., VIDEO_THS8200, VIDEO_THS7303, VIDEO_TDA7432).
This affects the ability to perform hardware-accelerated video rendering.

19. i2c Interface Video Support
Support for several i2c interface video devices has been disabled (e.g., VIDEO_V4L2_I2C, VIDEO_TLV320AIC23_I2C, VIDEO_WM8739_I2C).
This affects video processing over i2c-connected devices.

20. SoundWire Bus Support
Support for SoundWire bus audio devices has been disabled (e.g., SND_SOC_WCD938X_SDW, SND_SOC_CS35L41_SDW).
This impacts audio data transfer over the SoundWire bus.

21. Serial Interface Video Processing
Support for several serial interface video devices has been disabled (e.g., VIDEO_TLV320AIC23_SPI, VIDEO_WM8731_SPI, VIDEO_TLV320_SPI).
This affects serial bus-connected video processing devices.

22. Audio Microphone Detection
Support for audio microphone detection has been disabled (e.g., SND_SOC_WCD_MBHC).
Microphone detection and configuration functionality is disabled.

23. Multimedia Subsystem Devices
Support for several multimedia subsystem-related devices has been disabled (e.g., VIDEO_SOLO6X10, VIDEO_TEA6420, VIDEO_VIM2M).
This impacts devices related to multimedia signal processing.

24. Wireless Hotkey Support
Support for wireless network hotkey functionality has been disabled (e.g., WIRELESS_HOTKEY, WIRELESS_EXT).
Hotkey functionality for controlling wireless networks is no longer available.

25. Embedded Audio Compression Devices
Support for several embedded audio compression devices has been disabled (e.g., SND_SOC_CX2072X, SND_SOC_CS35L35, SND_SOC_TLV320AIC23).
Audio compression and decompression functionality is impacted.

26. USB Audio Device Support
Support for several USB audio devices has been disabled (e.g., SND_SOC_USB, SND_SOC_WM8804_USB, SND_SOC_CS35L41_USB).
USB audio input and output devices are no longer supported.
