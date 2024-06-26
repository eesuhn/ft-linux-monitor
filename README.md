## ft-linux-monitor

A command-line tool that displays real-time system information for your Linux

<img src="https://github.com/eesuhn/ft-linux-monitor/assets/102596628/f81367c8-50d4-4466-afee-266cc7967344" alt="screenshot" width="220" />

#### Installation
1. Clone in root:
	```sh
	git clone https://github.com/eesuhn/ft-linux-monitor.git $HOME/.ft-linux-monitor
	```
2. Run set-up script:
	```sh
	source $HOME/.ft-linux-monitor/set-up.sh
	```

#### Usage
```sh
lm <duration>
```
> `<duration>` is optional. Specify the number of <b>seconds</b> to run the monitor <br>
> If no duration is provided, it will run until `Ctrl+C` is pressed
