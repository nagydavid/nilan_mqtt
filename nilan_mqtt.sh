#!/bin/sh
case $1 in
       start)
	     sudo insmod /lib/modules/usbserial.ko
	     sudo insmod /lib/modules/ftdi_sio.ko
       echo "Starting Modbus Master modbus_api"
       python3 /volume1/public/nilan/modbus_api.py
       echo "Starting Nilan MQTT Publisher nilan_mqtt"
       python3 /volume1/public/nilan/nilan_mqtt.py --mqtt-host="192.168.1.122" --mqtt-port=1883
		 ;;
		 
       stop)
         echo "Stopping Nilan_MQTT"
		 ;;
       
	   *)
         echo "Usage: $0 [start|stop]"
		 ;;
esac
