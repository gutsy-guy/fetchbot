# Receive, parse, and pretty print OPT packets
# Sept 13, 2015
# jburke@ucla.edu 

import socket, json

port = 21234
s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
s.bind(("", port))
print "waiting on port:", port
while 1:
    data, addr = s.recvfrom(8192)
    data = data.rstrip("\0")   # https://github.com/OpenPTrack/open_ptrack/issues/52
    # print( "\n%s:%i - " %  addr)
    # print( json.dumps(json.loads(data), sort_keys=True, indent=4, separators=(',', ': ') )  )
    
    tracking_update = json.loads(data)
    if 'pose_tracks' in data:
        person_pose = tracking_update['pose_tracks'][0]
        #print( json.dumps(json.loads(data), sort_keys=True, indent=4, separators=(',', ': ') )  )
        print( "id:"+str(person_pose['id'])+", x:"+str(person_pose['joints']['HEAD']['x'])+", y:"+str(person_pose['joints']['HEAD']['y'])+", pose: "+person_pose['predicted_pose_name'])
