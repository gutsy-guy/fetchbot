
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
            try {
                var obj = JSON.parse(output);
            }
            catch (error) {
                console.log(`No JSON obj returned, status code: ${res.statusCode}`)
            }
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

deleteJSON = function(options, onResult, onError)
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
            onResult(res.statusCode);
        });
    });
    req.on('error', onError);
    req.end();
}

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

var move_to_position  = function(x, y, o){
    let path = URL + "missions/" + mission_id+ '/actions'
    let parameters = 
        {
            "action_type": "move_to_position",
            "mission_id": mission_id,
            "priority": 0,
            "parameters":[
                {"id": "x", "value": x},
                {"id": "y", "value": y},
                {"id": "orientation", "value": o},
                {"id": "retries", "value": 3},
                {"id": "distance_threshold", "value": 0.3}
            ]
        }

    console.log("Adding move action to test mission")
    let options = create_options(path, 'POST', parameters)
    let on_success = (status, obj) => {
        console.log("Move action added, adding test mission to queue")
        add_test_mission_to_queue()
    }
    postJSON(options,on_success, error_handler)
}

var add_test_mission_to_queue = function() {
    var path = URL+'mission_queue'
    var parameters = {
        "mission_id": mission_id,
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

var move_to_position_test_mission = function(x,y,o) {
    
    let path = URL + "missions/" + mission_id +'/actions'
    let options = create_options(path, 'GET', null)
    let on_success = (status, obj) => {
        for(i in obj) {
            console.log("Guid found: " + obj[i].guid)
            clear_action_from_test_mission(obj[i].guid)
        }
        console.log("CLEARED, begin move")
        move_to_position(x,y,o)
    }
    console.log("clearing actions from test mission")
    //deleteJSON(options, on_success, error_handler)
    getJSON(options, on_success, error_handler)
}

//delete other actions in mission, add new action and add that mission into miss que
var go_to_position = (x,y,o) => {
    console.log("Move to position TEST MISSION")
    move_to_position_test_mission(x,y,o)
}

var go_to_charger = function() {
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

var get_test_mission_actions = function() {
    let path = URL + "missions/" + mission_id +'/actions'
    let options = create_options(path, 'GET', null)
    postJSON(options,success_handler, error_handler)
}

var get_mission_actions = function(mission_guid) {
    let path = URL + "missions/" + mission_guid +'/actions'

    let options = create_options(path, 'GET', null)
    postJSON(options,success_handler, error_handler)
}

var clear_mission_queue = function(on_success) {
    let path = URL + "mission_queue"
    let options = create_options(path, 'DELETE', null)
    deleteJSON(options,on_success, error_handler)
}

// MARK: Controller logic

const args = require('minimist')(process.argv.slice(2));

if(args.i == "summon") {
    console.log("GO TO PERSON")
    let on_success = (status, obj) => {
        console.log("Mission queue cleared")
        go_to_position(12.063,15.747,0)
    }
    console.log("Clearing mission queue")
    clear_mission_queue(on_success)
} else if (args.i == "charger") {
    console.log("GO TO CHARGER")
    let on_success = (status, obj) => {
        console.log("Mission queue cleared")
        //go_to_position(17.501,17.735,90) // infront of rosie
	    go_to_charger()
    }
    clear_mission_queue(on_success)
}
