\newpage {}

# 3. Docker Images #

# 3.1 osdp-pd #

this is a docker image (amd64 ubuntu 26.20) of a libosdp-conformance instance configured
as a PD.

# 3.1.1 Operation #

Run it as-is with the noted configuration values.  SSH in to edit and change
the parameters, capture a trace etc.

# 3.1.1.1 Controlling the PD #

SSH in to control the PD.  username root password password.  cd to /opt/osdp-conformance/run/PD
to alter OSDP PD operation.  SCP can be used to fetch the trace or log files.

# 3.1.1.2 Reset to Defaults #

If comset or chlng are used parameters will be saved
in osdp-saved-parameters.json.   If this includes address/speed information
that will be used the next time the PD starts.

- delete osdp-saved-parameters.json to reset serial address/speed and to un-pair.

# 3.1.1.3 Restart #

To restart the PD from inside the container ssh in as root, cd to the PD home directory,
and start it.

```
cd /opt/osdp-conformance/run/PD
open-osdp
```

# 3.1.1.4 Logs #

- osdp.log in the PD directory is the PD log.
- current.osdpcap in the PD directory is the OSDP trace file

# 3.1.2 Configuration #

Note you can change the open-osdp-params.json file in /opt/osdp-conformance/run/PD
to tune this configuration.

- assumes serial port is /dev/ttyUSB0
- assumes speed 9600 address 0
- assumes secure channel is enabled but not initialized
- assumes osdpcap tracing.
- assumes log verbosity level 3 (normal)

# Punch List #

- attach mqtt command adapter
- confirm restart is available as a command

