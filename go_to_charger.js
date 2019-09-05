
let HOST = 'blue.vx.rmit.edu.au';
let PORT = 80;
let URL = '/api/v2.0.0/';
let mission_id = "3f9074ba-bf29-11e9-b263-94c691a73681"

//DANGER
var base64Encode = function(instr) {
    var buffer = new Buffer.from(instr);
    return buffer.toString('base64');
 }

let MIRPASS_SHA256 = '70701caac9a68e94d208f4a232e26a79df75e75655d86edb7d1312b3fa18a6b8';
let MY_AUTH = 'Basic ' + base64Encode('fetchbot:'+MIRPASS_SHA256);

var http = require("http");
var https = require("https");

var success_handler = (status, obj) => console.log("RESPONSE", status)

var error_handler = (status, obj) => console.log("ERROR",status)

var postJSON = (options, onResult) => {
    console.log("postJSON", options.host, options.path, ':', options.port, options);
    const req = http.request(options, (res) => {
        var output = '';
        console.log(`Status: ${res.statusCode}`);
        console.log(`Headers: ${JSON.stringify(res.headers)}`);
        res.setEncoding('utf8');
        res.on('data', (chunk) => {
            console.log(`BODY: ${chunk}`);
            output = output + chunk;
        });
        res.on('end', () => {
            console.log('End of response. Response was: "',output,'"');
            var obj = JSON.parse(output);
            onResult(res.statusCode, obj);
        });
    });

    req.on('error', (e) => {
        console.error(`problem with request: ${e.message}`);
      });
    
    // write data to request body
    console.log("outgoing body",'"',options.data,'"');
    req.write(options.data);
    req.end();
}

/**
 * getJSON:  REST get request returning JSON object(s)
 * @param options: http options object
 * @param callback: callback to pass the results JSON object(s) back
 */
getJSON = function(options, onResult, onError)
{
    console.log("getJSON", options.host, options.path, ':', options.port, options);
    var port = options.port == 443 ? https : http;
    var req = port.request(options, function(res)
    {
        var output = '';
        console.log(options.host + ': ' + res.statusCode);
        res.setEncoding('utf8');
        res.on('data', function (chunk) {
            output += chunk;
        });
        res.on('end', function() {
            console.log(output);
            var obj = JSON.parse(output);
            onResult(res.statusCode, obj);
        });
    });
    req.on('error', onError);
    req.end();
};

var create_options = (absoulte_path, request_type = 'GET',parameters) => {
   let option = {
       host: HOST,
       port: PORT,
       path: absoulte_path,
       method: request_type,
       headers: {
        'Content-Type': 'application/json',
        'Authorization': MY_AUTH
       },
       data: JSON.stringify(parameters)
   }
   return option
};

var move_relative_position = function(){
    let path = URL + "/missions/" + mission_id+ '/actions'
    let parameters = 
        {
            "action_type": "relative_move",
            "mission_id": mission_id,
            "priority": 0,
            "parameters":[
                {"id": "x", "value": 0.5},
                {"id": "y", "value": 0.5},
                {"id": "orientation", "value": 0},
                {"id": "max_linear_speed", "value": 0.2},
                {"id": "max_angular_speed", "value": 0.5},
                {"id": "collision_detection", "value": true},
            ]
        }

    let options = create_options(path, 'POST', parameters)
    postJSON(options,success_handler, error_handler)
}

var move_to_position  = function(x, y){
    let path = URL + "/missions/" + mission_id+ '/actions'
    let parameters = 
        {
            "action_type": "move_to_position",
            "mission_id": mission_id,
            "priority": 0,
            "parameters":[
                {"id": "x", "value": x},
                {"id": "y", "value": y},
                {"id": "orientation", "value": 0},
                {"id": "retries", "value": 3},
                {"id": "distance_threshold", "value": 0.3}
            ]
        }

    let options = create_options(path, 'POST', parameters)
    postJSON(options,success_handler, error_handler)
}

var add_test_mission_to_queue = function() {
    var path = URL+'mission_queue'
    var parameters = {
        "mission_id": "3f9074ba-bf29-11e9-b263-94c691a73681",
    }

    let options = create_options(path, 'POST', parameters)
    postJSON(options,success_handler, error_handler)
}

var add_mission_to_queue = function(mission_guid) {
    var path = URL+'mission_queue'
    var parameters = {
        "mission_id": mission_guid,
    }

    let options = create_options(path, 'POST', parameters)
    postJSON(options,success_handler, error_handler)
}

//delete other actions in mission, add new action and add that mission into miss que
var goto = (x,y) => {
    move_to_position(x,y)
    // move_relative_position()
    add_test_mission_to_queue()
}

var goToCharger = function() {
    add_mission_to_queue("1f5e67dd-b4ea-11e9-b263-94c691a73681")
}

var get_all_missions = function() {
    let path = URL + "missions"

    let options = create_options(path, 'GET', null)
    postJSON(options,success_handler, error_handler)
}

var clear_action_from_test_mission = function(action_id) {
    let path = URL + "missions/" + mission_id+ '/actions/' + action_id

    let options = create_options(path, 'DELETE', null)
    postJSON(options,success_handler, error_handler)
}

var get_current_mission_actions = function() {
    let path = URL + "missions/" + mission_id +'/actions'

    let options = create_options(path, 'GET', null)
    postJSON(options,success_handler, error_handler)
}

var get_mission_actions = function(mission_guid) {
    let path = URL + "missions/" + mission_guid +'/actions'

    let options = create_options(path, 'GET', null)
    postJSON(options,success_handler, error_handler)
}

// DUPLICATED GUIDS (All deleted)
// 183ea643-c313-11e9-b263-94c691a73681 +
// 7659682e-c56f-11e9-b9f8-94c691a73681 +
// 1162b0a5-c570-11e9-b9f8-94c691a73681 +
// 1bed6258-c570-11e9-b9f8-94c691a73681 +
// 32e38f48-c570-11e9-b9f8-94c691a73681 +
// 72f98d59-c570-11e9-b9f8-94c691a73681 +
// 8eba4226-c570-11e9-b9f8-94c691a73681 + 
// b7f617cf-c570-11e9-b9f8-94c691a73681 +
// d8ae23d8-c570-11e9-b9f8-94c691a73681 +
// 94f0bc62-c571-11e9-b9f8-94c691a73681 +
// a187441a-c880-11e9-b9f8-94c691a73681 +

// get_current_mission_actions()
// clear_action_from_test_mission("a187441a-c880-11e9-b9f8-94c691a73681")
// get_all_missions()
// goto(12.063,15.747)
goToCharger()

// Go to charger mission guid
// 1f5e67dd-b4ea-11e9-b263-94c691a73681

/* govlab locations
"orientation": 0.8326653838157654, 
        "x": 12.062671661376953, 
        "y": 15.74654769897461
*/
