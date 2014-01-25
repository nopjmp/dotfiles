#tp_smapi
import math
import time

class Data:
    """
    Data class to fetch tp_smapi battery data and format
    """
    def __init__(self):
        self.state_format = {'idle':[''],
                'charging':[''],
                'discharging':['','','','']
                }
        self.state_time = {'idle': None,
                'charging': 'remaining_charging_time',
                'discharging': 'remaining_running_time'
                }
        self.sys_path = '/sys/devices/platform/smapi/BAT0/'
        self.state = self.read_state()
        self.remaining_percent = self.read_remaining_percent()
        self.remaining_charging_time = self.read_remaining_charging_time()
        self.remaining_running_time = self.read_remaining_running_time()

    def readFile(self, filename):
        with open(self.sys_path + filename, 'r') as f:
            return f.read().rstrip()

    def installed(self):
        return int(self.readFile('installed'))

    def read_state(self):
        return self.readFile('state')

    def read_remaining_percent(self):
        return int(self.readFile('remaining_percent'))

    def read_remaining_charging_time(self):
        try:
            return int(self.readFile('remaining_charging_time'))
        except:
            return 0

    def read_remaining_running_time(self):
        try:
            return int(self.readFile('remaining_running_time_now'))
        except:
            return 0

    def formatted_time(self):
        # very confusing, but it works
        timeleft = 0
        timeleftvar = self.state_time[self.state]
        if timeleftvar:
            timeleft = self.__dict__[timeleftvar]
        hoursleft = math.floor(timeleft / 60)
        minutesleft = math.floor(timeleft - (hoursleft * 60))
        return "{:0>2}:{:0>2}".format(hoursleft, minutesleft)

    def formatted_state(self):
        state_int = (100 - self.remaining_percent) // 25
        return (state_int, self.state_format[self.state][state_int])

    def update(self):
        self.state = self.read_state()
        self.remaining_percent = self.read_remaining_percent()
        self.remaining_charging_time = self.read_remaining_charging_time()
        self.remaining_running_time = self.read_remaining_running_time()

    def is_idle(self):
        return self.state is 'idle'


class Py3status:
    """
    ThinkPad Battery using tp_smapi in i3bar
    """
    def __init__(self):
        self.data = Data()
        self.color_dict = {0:'color_good', 1:'color_degraded', 2:'color_bad'}

    def battery(self, i3status_output_json, i3status_config):
        self.data.update()

        response = {'full_text': '', 'name': 'tp_smapi'}
        state_int, state = self.data.formatted_state()

        response['color'] = i3status_config[self.color_dict[state_int]]
        if self.data.is_idle():
            response['full_text'] = "{} {}%".format(state,
                                                      self.data.remaining_percent)
        else:
            response['full_text'] = "{} {}% {}".format(state,
                                                          self.data.remaining_percent,
                                                          self.data.formatted_time())
        # cache the status for 30 seconds
        response['cached_until'] = time.time() + 5 
        return (4, response)

