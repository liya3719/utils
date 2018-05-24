var http = require('http');
var fs = require('fs');
var createHandler = require('node-gitlab-webhook');
var files = fs.readdirSync('/data/');
var handler = createHandler([
	{path:'/webhook1', secret: 'oneTomany'},
	{path: '/webhook2', secret: 'userCenter'},
	{path: '/webhook3', secret: 'studyEffect'},
	{path: '/webhook4', secret: 'apolloWeb'},
	{path: '/webhook5', secret: 'collapsar'},
	{path: '/webhook6', secret: 'minifuncamp'}
]);

function runCommand(cmd, args, callback) {
	var spawn = require('child_process').spawn;
	var child = spawn(cmd, args, {shell:true});
	var resp = '';
	child.stdout.on('data', function(buffer) {
		resp += buffer.toString();
	});
	child.stdout.on('end', function() {
		callback(resp);
	});
}
http.createServer(function(req, res) {
	handler(req, res, function(err) {
		res.statusCode = 404;
		res.end('no such location');
	})
}).listen(7777);
handler.on('error', function(err) {
	console.error('handler Error %s', err.message);
});

handler.on('push', function(event) {
	console.log('Received a push event for %s to %s', event.payload.repository.name, event.payload.ref);
	if(event.payload.ref.indexOf('nat/test') != -1) {
		var path = `/data/${event.payload.repository.name}/`;
		for(let i = 0; i < files.length; i++) {
			if(files[i] == event.payload.repository.name) {
				runCommand('sh', ['/data/webhook/auto_pull.sh', path], function(txt) {
					console.log(`${files[i]} 拉取完成`);	
				})	
			}
		}
	}
})


