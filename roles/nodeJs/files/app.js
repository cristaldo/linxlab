
var express = require('express');
var app = express();
var cluster = require('cluster'), os = require('os');

   if (cluster.isMaster) {
	var cpus = os.cpus().length;
	for (var i = 0; i <= cpus; i++) {
		cluster.fork();
		}

	cluster.on('listening', function(worker) {
		console.log('Cluster %d esta conectado.', worker.process.pid);
	});

	cluster.on('disconnect', function(worker) {
		console.log('Cluster %d esta desconectado.', worker.process.pid);
	});

	cluster.on('exit', function(worker) {
		console.log('Cluster %d caiu fora.', worker.process.pid);
	});

 } else {

	app.get('/', function (req, res) {
		res.send(' Hello World Lynx!\n');
	});

	app.listen(3000, function () {
		console.log('Example app listening on port 3000!');
	});

}
