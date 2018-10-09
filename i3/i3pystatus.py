from i3pystatus import Status

status = Status()

status.register('calendar')

status.register("clock",
    format=("_%a %-d %b %X KW%V", "Europe/Berlin"),)

status.register("temp",
    format="_{temp:.0f}°C",)

status.register("battery",
    format="{status}_{remaining:%E%hh:%Mm}",
    alert=True,
    alert_percentage=5,
    status={
        "DIS":  "",
        "CHR":  "",
        "FULL": "",
    },)

status.register("network",
    interface="enp0s31f6",
    format_up="{v4cidr}",
    format_down=""
)

status.register("network",
    interface="wlp0s20f3",
    format_up="_{essid} ({quality}%)",
    format_down="",
)

status.register("alsa",
    format="_{volume}",)

status.run()
